//------------------------------------------------------------------------------
//Copyright (c) 2010 Carnegie Institution for Science. All rights reserved
// $Revision: 1.1 $
// $Date: 2004/07/06 16:29:31 $
//------------------------------------------------------------------------------
package org.tair.processor.microarray.data.factory;


/**
 * MasterFactory is a simple container class that contains all type specific 
 * factories used for object population and validation in the microarray loading
 * programs. MasterFactory serves as a convenient way for all data file parsing
 * classes to access whichever type specific factories they may need. Since
 * all factories maintain object caches of previously populated items, we need
 * some way of making the same instance of each factory available to the 
 * different classes that use it in order to fully leverage the benefit of
 * caching. MasterFactory enables this by allowing classes to gain access
 * to all factories through the single reference to MasterFactory.
 */

public class MasterFactory {

    // scanning software data
    private AnalysisSoftwareFactory analysisSoftwareFactory;

    // array design data
    private ArrayDesignFactory arrayDesignFactory;

    // clone data
    private CloneFactory cloneFactory;

    // community data
    private CommunityFactory communityFactory;

    // germplasm data
    private GermplasmFactory germplasmFactory;

    // keyword data
    private KeywordFactory keywordFactory;

    // polymorphism/allele data
    private PolymorphismFactory polymorphismFactory;

    // protocol data - labeling, extraction and hybridization
    private ProtocolFactory protocolFactory;

    // species variants
    private SpeciesVariantFactory speciesVariantFactory;


    /**
     * Creates an instance of MasterFactory and initializes all
     * type specific factories
     */
    public MasterFactory() { 
	analysisSoftwareFactory = new AnalysisSoftwareFactory(); 
	arrayDesignFactory = new ArrayDesignFactory(); 
	cloneFactory = new CloneFactory(); 
	communityFactory = new CommunityFactory(); 
	germplasmFactory = new GermplasmFactory(); 
	keywordFactory = new KeywordFactory(); 
	polymorphismFactory = new PolymorphismFactory();
	protocolFactory = new ProtocolFactory(); 
	speciesVariantFactory = new SpeciesVariantFactory(); 
    }


    /**
     * Retrieves factory for creating analysis software data objects.
     *
     * @return factory for creating analysis software objects
     */
    public AnalysisSoftwareFactory getAnalysisSoftwareFactory() {
	return analysisSoftwareFactory;
    }

    /**
     * Retrieves factory for creating array design data objects
     *
     * @return factory for creating array design objects
     */
    public ArrayDesignFactory getArrayDesignFactory() {
	return arrayDesignFactory;
    }

    /**
     * Retrieves factory for creating clone data objects
     *
     * @return factory for creating clone objects
     */
    public CloneFactory getCloneFactory() {
	return cloneFactory;
    }

    /**
     * Retrieves factory for creating community data objects
     *
     * @return factory for creating community objects
     */
    public CommunityFactory getCommunityFactory() {
	return communityFactory;
    }


    /**
     * Retrieves factory for creating germplasm data objects
     *
     * @return factory for creating germplasm objects
     */
    public GermplasmFactory getGermplasmFactory() {
	return germplasmFactory;
    }

    /**
     * Retrieves factory for creating keyword data objects
     *
     * @return factory for creating keyword objects
     */
    public KeywordFactory getKeywordFactory() {
	return keywordFactory;
    }



    /**
     * Retrieves factory for creating polymorphism data objects
     *
     * @return factory for creating polymorphism objects
     */
    public PolymorphismFactory getPolymorphismFactory() {
	return polymorphismFactory;
    }

    /**
     * Retrieves factory for creating protocol data objects
     *
     * @return factory for creating protocol objects
     */
    public ProtocolFactory getProtocolFactory() {
	return protocolFactory;
    }

    /**
     * Retrieves factory for creating species variant data objects
     *
     * @return factory for creating species variant objects
     */
    public SpeciesVariantFactory getSpeciesVariantFactory() {
	return speciesVariantFactory;
    }


}

