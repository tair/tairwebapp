/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.servlet;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.regex.*;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;

public class GoTerms extends HttpServlet
{
	static List<Term> cache = null;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		printTerms(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		printTerms(req, res);
	}

	private void printTerms(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		StringBuffer sb = new StringBuffer();
		for(Suggestion sug: getTerms(req.getParameter("q"))){
			sb.append(String.format("\\n%s|%s", sug.term.keyword.replace("'","\\'"), sug.term.id));
			if(sug.term.synonym != null)
				sb.append("|"+sug.term.synonym.replace("'","\\'"));
		}
		if(sb.length() > 0) sb.delete(0,2); // clean up unwanted "\n"
		PrintWriter out = res.getWriter();
		out.print(req.getParameter("callback"));
		out.print("({data:'" + sb + "'});");
	}

	List<Suggestion> getTerms(String text)
	{
		if(text == null) return Collections.emptyList();
		if(cache == null) loadCache();

		String tokens[] = text.toUpperCase().split("\\s+");
		String patterns[] = new String[tokens.length];
		for(int i = 0; i < tokens.length; ++i)
			patterns[i] = ".?\\b" + tokens[i] + "\\b.?";

		Map<String,Suggestion> terms = new HashMap<String,Suggestion>();
		for(Term term: cache)
			insert(terms, term, doRank(term, tokens, patterns));
		return top(terms, 15);
	}

	public int doRank(Term term, String tokens[], String patterns[])
	{
		int starts[] = new int[tokens.length];
		if(term.field == null) return 0;
		int end, start, tok_len, rank = 0, len = term.field.length();
		float ratio = 0;
		for(int i = 0; i < tokens.length; ++i){
			start = starts[i] = term.field.indexOf(tokens[i]);
			if(start > -1){
				rank++;
				if(start > 0) start -= 1;
				tok_len = tokens[i].length();
				end = 1 + starts[i] + tok_len;
				if(end > len) end = len;
				if(term.field.substring(start,end).matches(patterns[i]))
					rank++;
				for(int j = 0; j < i; ++j)
					if(starts[j] < starts[i])
						rank++;
				ratio += tok_len / (float)len;
			}
		}
		rank = (int)(rank * 10000.0 * ratio);
		return rank;
	}

	public void insert(Map<String,Suggestion> terms, Term term, int rank)
	{
		if(rank < 1) return;
		Suggestion sug = terms.get(term.id);
		if(sug == null){
			sug = new Suggestion();
			terms.put(term.id, sug);
		}
		if(sug.rank < rank){
			sug.term = term;
			sug.rank = rank;
		} else if(sug.rank == rank && sug.term.synonym == null)
			sug.term = term;
	}

	public List<Suggestion> top(Map<String,Suggestion> terms, int number)
	{
		List<Suggestion> suggestions = new ArrayList<Suggestion>(terms.values());
		Collections.sort(suggestions);
		int len = terms.size();
		return suggestions.subList(0, number < len ? number : len);
	}

	private void LoadCache()
	{
		cache = new ArrayList<Term>();
		cache.add(new Term("GO:99999", "Term1", "Hoopah Shazam Wowza", "Hoopah Shazam Wowza"));
		cache.add(new Term("GO:99998", "Term2", "Shazam Hoopah", "Shazam Hoopah"));
		cache.add(new Term("GO:99997", "Term3", "Hoopah Shazam", "Hoopah Shazam"));
		cache.add(new Term("GO:99996", "Term3", "Hoopah Doopah", "Hoopah Doopah"));
		cache.add(new Term("GO:99995", "Term3", "antiHoopah Shazamism Wowzalogy", "antiHoopah Shazamism Wowzalogy"));
	}

	private void loadCache()
	{
		cache = new ArrayList<Term>();
		try {
			DBReadManager pool = DBReadManager.getInstance();
			DBconnection conn = pool.get_connection();
			conn.setQuery("SELECT extdb_id, keyword FROM Keyword WHERE (extdb_id like 'GO:%' OR extdb_id like 'PO:%') AND keyword_uc NOT LIKE 'OBSOLETE%' AND definition NOT LIKE '%OBSOLETE%'");
			ResultSet rs = conn.getResultSet();
			while(rs.next())
				cache.add(new Term(rs.getString("extdb_id"), rs.getString("keyword"), null, rs.getString("keyword")));
			conn.setQuery("SELECT k.extdb_id, k.keyword, s.term_synonym AS syn FROM Synonym s, Keyword k WHERE k.keyword_id = s.keyword_id AND (k.extdb_id like 'GO:%' OR k.extdb_id like 'PO:%') AND k.keyword_uc NOT LIKE 'OBSOLETE%' AND k.definition NOT LIKE '%OBSOLETE%'");
			rs = conn.getResultSet();
			while(rs.next())
				cache.add(new Term(rs.getString("extdb_id"), rs.getString("keyword"), rs.getString("syn"), rs.getString("syn")));
			pool.return_connection(conn);
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("Cached terms: " + cache.size());
	}

	class Term
	{
		String id, keyword, synonym, field;
		public Term(String id, String keyword, String synonym, String field) {
			this.id = id;
			this.keyword = keyword;
			this.synonym = synonym;
			this.field = field == null ? null : field.toUpperCase();
		}
		public Term(Term term) {
			this(term.id, term.keyword, term.synonym, term.field);
		}
	}

	class Suggestion implements Comparable<Suggestion>
	{
		Term term = null;
		int rank = -1;
		public int compareTo(Suggestion that) {
			return that.rank - this.rank;
		}
	}
}
