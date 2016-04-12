<?php



/**
 * This class defines the structure of the 'shop_wishes' table.
 *
 *
 *
 * This map class is used by Propel to do runtime db structure discovery.
 * For example, the createSelectSql() method checks the type of a given column used in an
 * ORDER BY clause to know whether it needs to apply SQL to make the ORDER BY case-insensitive
 * (i.e. if it's a text column type).
 *
 * @package    propel.generator.Shop.map
 */
class SWishesTableMap extends TableMap {

	/**
	 * The (dot-path) name of this class
	 */
	const CLASS_NAME = 'Shop.map.SWishesTableMap';

	/**
	 * Initialize the table attributes, columns and validators
	 * Relations are not initialized by this method since they are lazy loaded
	 *
	 * @return     void
	 * @throws     PropelException
	 */
	public function initialize()
	{
	  // attributes
		$this->setName('shop_wishes');
		$this->setPhpName('SWishes');
		$this->setClassname('SWishes');
		$this->setPackage('Shop');
		$this->setUseIdGenerator(true);
		// columns
		$this->addPrimaryKey('ID', 'Id', 'INTEGER', true, null, null);
		$this->addColumn('USER_ID', 'UserId', 'INTEGER', false, null, null);
		$this->addColumn('KEY', 'Key', 'VARCHAR', true, 255, null);
		$this->addColumn('USER_FULL_NAME', 'UserFullName', 'VARCHAR', false, 255, null);
		$this->addColumn('USER_EMAIL', 'UserEmail', 'VARCHAR', false, 255, null);
		$this->addColumn('USER_PHONE', 'UserPhone', 'VARCHAR', false, 255, null);
		$this->addColumn('USER_COMMENT', 'UserComment', 'VARCHAR', false, 1000, null);
		$this->addColumn('DATE_CREATED', 'DateCreated', 'INTEGER', false, null, null);
		$this->addColumn('USER_IP', 'UserIp', 'VARCHAR', false, 255, null);
		// validators
	} // initialize()

	/**
	 * Build the RelationMap objects for this table relationships
	 */
	public function buildRelations()
	{
    $this->addRelation('SWishProducts', 'SWishProducts', RelationMap::ONE_TO_MANY, array('id' => 'wish_id', ), 'CASCADE', null);
	} // buildRelations()

} // SWishesTableMap
