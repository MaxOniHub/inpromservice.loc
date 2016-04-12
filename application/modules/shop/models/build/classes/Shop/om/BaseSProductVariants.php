<?php


/**
 * Base class that represents a row from the 'shop_product_variants' table.
 *
 * 
 *
 * @package    propel.generator.Shop.om
 */
abstract class BaseSProductVariants extends ShopBaseObject  implements Persistent
{

	/**
	 * Peer class name
	 */
	const PEER = 'SProductVariantsPeer';

	/**
	 * The Peer class.
	 * Instance provides a convenient way of calling static methods on a class
	 * that calling code may not be able to identify.
	 * @var        SProductVariantsPeer
	 */
	protected static $peer;

	/**
	 * The flag var to prevent infinit loop in deep copy
	 * @var       boolean
	 */
	protected $startCopy = false;

	/**
	 * The value for the id field.
	 * @var        int
	 */
	protected $id;

	/**
	 * The value for the external_id field.
	 * @var        string
	 */
	protected $external_id;

	/**
	 * The value for the product_id field.
	 * @var        int
	 */
	protected $product_id;

	/**
	 * The value for the price field.
	 * @var        double
	 */
	protected $price;

	/**
	 * The value for the number field.
	 * @var        string
	 */
	protected $number;

	/**
	 * The value for the stock field.
	 * @var        int
	 */
	protected $stock;

	/**
	 * The value for the mainimage field.
	 * @var        string
	 */
	protected $mainimage;

	/**
	 * The value for the smallimage field.
	 * @var        string
	 */
	protected $smallimage;

	/**
	 * The value for the position field.
	 * @var        int
	 */
	protected $position;

	/**
	 * The value for the currency field.
	 * @var        int
	 */
	protected $currency;

	/**
	 * The value for the price_in_main field.
	 * @var        string
	 */
	protected $price_in_main;

	/**
	 * @var        SProducts
	 */
	protected $aSProducts;

	/**
	 * @var        SCurrencies
	 */
	protected $aSCurrencies;

	/**
	 * @var        array ShopKitProduct[] Collection to store aggregation of ShopKitProduct objects.
	 */
	protected $collShopKitProducts;

	/**
	 * @var        array SProductVariantsI18n[] Collection to store aggregation of SProductVariantsI18n objects.
	 */
	protected $collSProductVariantsI18ns;

	/**
	 * @var        array SNotifications[] Collection to store aggregation of SNotifications objects.
	 */
	protected $collSNotificationss;

	/**
	 * @var        array SOrderProducts[] Collection to store aggregation of SOrderProducts objects.
	 */
	protected $collSOrderProductss;

	/**
	 * Flag to prevent endless save loop, if this object is referenced
	 * by another object which falls in this transaction.
	 * @var        boolean
	 */
	protected $alreadyInSave = false;

	/**
	 * Flag to prevent endless validation loop, if this object is referenced
	 * by another object which falls in this transaction.
	 * @var        boolean
	 */
	protected $alreadyInValidation = false;

	// i18n behavior
	
	/**
	 * Current locale
	 * @var        string
	 */
	protected $currentLocale = 'ru';
	
	/**
	 * Current translation objects
	 * @var        array[SProductVariantsI18n]
	 */
	protected $currentTranslations;

	/**
	 * An array of objects scheduled for deletion.
	 * @var		array
	 */
	protected $shopKitProductsScheduledForDeletion = null;

	/**
	 * An array of objects scheduled for deletion.
	 * @var		array
	 */
	protected $sProductVariantsI18nsScheduledForDeletion = null;

	/**
	 * An array of objects scheduled for deletion.
	 * @var		array
	 */
	protected $sNotificationssScheduledForDeletion = null;

	/**
	 * An array of objects scheduled for deletion.
	 * @var		array
	 */
	protected $sOrderProductssScheduledForDeletion = null;

	/**
	 * Get the [id] column value.
	 * 
	 * @return     int
	 */
	public function getId()
	{
		return $this->id;
	}

	/**
	 * Get the [external_id] column value.
	 * 
	 * @return     string
	 */
	public function getExternalId()
	{
		return $this->external_id;
	}

	/**
	 * Get the [product_id] column value.
	 * 
	 * @return     int
	 */
	public function getProductId()
	{
		return $this->product_id;
	}

	/**
	 * Get the [price] column value.
	 * 
	 * @return     double
	 */
	public function getPrice()
	{
		return $this->price;
	}

	/**
	 * Get the [number] column value.
	 * 
	 * @return     string
	 */
	public function getNumber()
	{
		return $this->number;
	}

	/**
	 * Get the [stock] column value.
	 * 
	 * @return     int
	 */
	public function getStock()
	{
		return $this->stock;
	}

	/**
	 * Get the [mainimage] column value.
	 * 
	 * @return     string
	 */
	public function getMainimage()
	{
		return $this->mainimage;
	}

	/**
	 * Get the [smallimage] column value.
	 * 
	 * @return     string
	 */
	public function getSmallimage()
	{
		return $this->smallimage;
	}

	/**
	 * Get the [position] column value.
	 * 
	 * @return     int
	 */
	public function getPosition()
	{
		return $this->position;
	}

	/**
	 * Get the [currency] column value.
	 * 
	 * @return     int
	 */
	public function getCurrency()
	{
		return $this->currency;
	}

	/**
	 * Get the [price_in_main] column value.
	 * 
	 * @return     string
	 */
	public function getPriceInMain()
	{
		return $this->price_in_main;
	}

	/**
	 * Set the value of [id] column.
	 * 
	 * @param      int $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setId($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->id !== $v) {
			$this->id = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::ID;
		}

		return $this;
	} // setId()

	/**
	 * Set the value of [external_id] column.
	 * 
	 * @param      string $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setExternalId($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->external_id !== $v) {
			$this->external_id = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::EXTERNAL_ID;
		}

		return $this;
	} // setExternalId()

	/**
	 * Set the value of [product_id] column.
	 * 
	 * @param      int $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setProductId($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->product_id !== $v) {
			$this->product_id = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::PRODUCT_ID;
		}

		if ($this->aSProducts !== null && $this->aSProducts->getId() !== $v) {
			$this->aSProducts = null;
		}

		return $this;
	} // setProductId()

	/**
	 * Set the value of [price] column.
	 * 
	 * @param      double $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setPrice($v)
	{
		if ($v !== null) {
			$v = (double) $v;
		}

		if ($this->price !== $v) {
			$this->price = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::PRICE;
		}

		return $this;
	} // setPrice()

	/**
	 * Set the value of [number] column.
	 * 
	 * @param      string $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setNumber($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->number !== $v) {
			$this->number = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::NUMBER;
		}

		return $this;
	} // setNumber()

	/**
	 * Set the value of [stock] column.
	 * 
	 * @param      int $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setStock($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->stock !== $v) {
			$this->stock = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::STOCK;
		}

		return $this;
	} // setStock()

	/**
	 * Set the value of [mainimage] column.
	 * 
	 * @param      string $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setMainimage($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->mainimage !== $v) {
			$this->mainimage = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::MAINIMAGE;
		}

		return $this;
	} // setMainimage()

	/**
	 * Set the value of [smallimage] column.
	 * 
	 * @param      string $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setSmallimage($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->smallimage !== $v) {
			$this->smallimage = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::SMALLIMAGE;
		}

		return $this;
	} // setSmallimage()

	/**
	 * Set the value of [position] column.
	 * 
	 * @param      int $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setPosition($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->position !== $v) {
			$this->position = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::POSITION;
		}

		return $this;
	} // setPosition()

	/**
	 * Set the value of [currency] column.
	 * 
	 * @param      int $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setCurrency($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->currency !== $v) {
			$this->currency = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::CURRENCY;
		}

		if ($this->aSCurrencies !== null && $this->aSCurrencies->getId() !== $v) {
			$this->aSCurrencies = null;
		}

		return $this;
	} // setCurrency()

	/**
	 * Set the value of [price_in_main] column.
	 * 
	 * @param      string $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setPriceInMain($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->price_in_main !== $v) {
			$this->price_in_main = $v;
			$this->modifiedColumns[] = SProductVariantsPeer::PRICE_IN_MAIN;
		}

		return $this;
	} // setPriceInMain()

	/**
	 * Indicates whether the columns in this object are only set to default values.
	 *
	 * This method can be used in conjunction with isModified() to indicate whether an object is both
	 * modified _and_ has some values set which are non-default.
	 *
	 * @return     boolean Whether the columns in this object are only been set with default values.
	 */
	public function hasOnlyDefaultValues()
	{
		// otherwise, everything was equal, so return TRUE
		return true;
	} // hasOnlyDefaultValues()

	/**
	 * Hydrates (populates) the object variables with values from the database resultset.
	 *
	 * An offset (0-based "start column") is specified so that objects can be hydrated
	 * with a subset of the columns in the resultset rows.  This is needed, for example,
	 * for results of JOIN queries where the resultset row includes columns from two or
	 * more tables.
	 *
	 * @param      array $row The row returned by PDOStatement->fetch(PDO::FETCH_NUM)
	 * @param      int $startcol 0-based offset column which indicates which restultset column to start with.
	 * @param      boolean $rehydrate Whether this object is being re-hydrated from the database.
	 * @return     int next starting column
	 * @throws     PropelException  - Any caught Exception will be rewrapped as a PropelException.
	 */
	public function hydrate($row, $startcol = 0, $rehydrate = false)
	{
		try {

			$this->id = ($row[$startcol + 0] !== null) ? (int) $row[$startcol + 0] : null;
			$this->external_id = ($row[$startcol + 1] !== null) ? (string) $row[$startcol + 1] : null;
			$this->product_id = ($row[$startcol + 2] !== null) ? (int) $row[$startcol + 2] : null;
			$this->price = ($row[$startcol + 3] !== null) ? (double) $row[$startcol + 3] : null;
			$this->number = ($row[$startcol + 4] !== null) ? (string) $row[$startcol + 4] : null;
			$this->stock = ($row[$startcol + 5] !== null) ? (int) $row[$startcol + 5] : null;
			$this->mainimage = ($row[$startcol + 6] !== null) ? (string) $row[$startcol + 6] : null;
			$this->smallimage = ($row[$startcol + 7] !== null) ? (string) $row[$startcol + 7] : null;
			$this->position = ($row[$startcol + 8] !== null) ? (int) $row[$startcol + 8] : null;
			$this->currency = ($row[$startcol + 9] !== null) ? (int) $row[$startcol + 9] : null;
			$this->price_in_main = ($row[$startcol + 10] !== null) ? (string) $row[$startcol + 10] : null;
			$this->resetModified();

			$this->setNew(false);

			if ($rehydrate) {
				$this->ensureConsistency();
			}

			return $startcol + 11; // 11 = SProductVariantsPeer::NUM_HYDRATE_COLUMNS.

		} catch (Exception $e) {
			throw new PropelException("Error populating SProductVariants object", $e);
		}
	}

	/**
	 * Checks and repairs the internal consistency of the object.
	 *
	 * This method is executed after an already-instantiated object is re-hydrated
	 * from the database.  It exists to check any foreign keys to make sure that
	 * the objects related to the current object are correct based on foreign key.
	 *
	 * You can override this method in the stub class, but you should always invoke
	 * the base method from the overridden method (i.e. parent::ensureConsistency()),
	 * in case your model changes.
	 *
	 * @throws     PropelException
	 */
	public function ensureConsistency()
	{

		if ($this->aSProducts !== null && $this->product_id !== $this->aSProducts->getId()) {
			$this->aSProducts = null;
		}
		if ($this->aSCurrencies !== null && $this->currency !== $this->aSCurrencies->getId()) {
			$this->aSCurrencies = null;
		}
	} // ensureConsistency

	/**
	 * Reloads this object from datastore based on primary key and (optionally) resets all associated objects.
	 *
	 * This will only work if the object has been saved and has a valid primary key set.
	 *
	 * @param      boolean $deep (optional) Whether to also de-associated any related objects.
	 * @param      PropelPDO $con (optional) The PropelPDO connection to use.
	 * @return     void
	 * @throws     PropelException - if this object is deleted, unsaved or doesn't have pk match in db
	 */
	public function reload($deep = false, PropelPDO $con = null)
	{
		if ($this->isDeleted()) {
			throw new PropelException("Cannot reload a deleted object.");
		}

		if ($this->isNew()) {
			throw new PropelException("Cannot reload an unsaved object.");
		}

		if ($con === null) {
			$con = Propel::getConnection(SProductVariantsPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		// We don't need to alter the object instance pool; we're just modifying this instance
		// already in the pool.

		$stmt = SProductVariantsPeer::doSelectStmt($this->buildPkeyCriteria(), $con);
		$row = $stmt->fetch(PDO::FETCH_NUM);
		$stmt->closeCursor();
		if (!$row) {
			throw new PropelException('Cannot find matching row in the database to reload object values.');
		}
		$this->hydrate($row, 0, true); // rehydrate

		if ($deep) {  // also de-associate any related objects?

			$this->aSProducts = null;
			$this->aSCurrencies = null;
			$this->collShopKitProducts = null;

			$this->collSProductVariantsI18ns = null;

			$this->collSNotificationss = null;

			$this->collSOrderProductss = null;

		} // if (deep)
	}

	/**
	 * Removes this object from datastore and sets delete attribute.
	 *
	 * @param      PropelPDO $con
	 * @return     void
	 * @throws     PropelException
	 * @see        BaseObject::setDeleted()
	 * @see        BaseObject::isDeleted()
	 */
	public function delete(PropelPDO $con = null)
	{
		if ($this->isDeleted()) {
			throw new PropelException("This object has already been deleted.");
		}

		if ($con === null) {
			$con = Propel::getConnection(SProductVariantsPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		$con->beginTransaction();
		try {
			$deleteQuery = SProductVariantsQuery::create()
				->filterByPrimaryKey($this->getPrimaryKey());
			$ret = $this->preDelete($con);
			if ($ret) {
				$deleteQuery->delete($con);
				$this->postDelete($con);
				// i18n behavior
				
				// emulate delete cascade
				SProductVariantsI18nQuery::create()
					->filterBySProductVariants($this)
					->delete($con);
				$con->commit();
				$this->setDeleted(true);
			} else {
				$con->commit();
			}
		} catch (Exception $e) {
			$con->rollBack();
			throw $e;
		}
	}

	/**
	 * Persists this object to the database.
	 *
	 * If the object is new, it inserts it; otherwise an update is performed.
	 * All modified related objects will also be persisted in the doSave()
	 * method.  This method wraps all precipitate database operations in a
	 * single transaction.
	 *
	 * @param      PropelPDO $con
	 * @return     int The number of rows affected by this insert/update and any referring fk objects' save() operations.
	 * @throws     PropelException
	 * @see        doSave()
	 */
	public function save(PropelPDO $con = null)
	{
		if ($this->isDeleted()) {
			throw new PropelException("You cannot save an object that has been deleted.");
		}

		if ($con === null) {
			$con = Propel::getConnection(SProductVariantsPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		$con->beginTransaction();
		$isInsert = $this->isNew();
		try {
			$ret = $this->preSave($con);
			if ($isInsert) {
				$ret = $ret && $this->preInsert($con);
			} else {
				$ret = $ret && $this->preUpdate($con);
			}
			if ($ret) {
				$affectedRows = $this->doSave($con);
				if ($isInsert) {
					$this->postInsert($con);
				} else {
					$this->postUpdate($con);
				}
				$this->postSave($con);
				SProductVariantsPeer::addInstanceToPool($this);
			} else {
				$affectedRows = 0;
			}
			$con->commit();
			return $affectedRows;
		} catch (Exception $e) {
			$con->rollBack();
			throw $e;
		}
	}

	/**
	 * Performs the work of inserting or updating the row in the database.
	 *
	 * If the object is new, it inserts it; otherwise an update is performed.
	 * All related objects are also updated in this method.
	 *
	 * @param      PropelPDO $con
	 * @return     int The number of rows affected by this insert/update and any referring fk objects' save() operations.
	 * @throws     PropelException
	 * @see        save()
	 */
	protected function doSave(PropelPDO $con)
	{
		$affectedRows = 0; // initialize var to track total num of affected rows
		if (!$this->alreadyInSave) {
			$this->alreadyInSave = true;

			// We call the save method on the following object(s) if they
			// were passed to this object by their coresponding set
			// method.  This object relates to these object(s) by a
			// foreign key reference.

			if ($this->aSProducts !== null) {
				if ($this->aSProducts->isModified() || $this->aSProducts->isNew()) {
					$affectedRows += $this->aSProducts->save($con);
				}
				$this->setSProducts($this->aSProducts);
			}

			if ($this->aSCurrencies !== null) {
				if ($this->aSCurrencies->isModified() || $this->aSCurrencies->isNew()) {
					$affectedRows += $this->aSCurrencies->save($con);
				}
				$this->setSCurrencies($this->aSCurrencies);
			}

			if ($this->isNew() || $this->isModified()) {
				// persist changes
				if ($this->isNew()) {
					$this->doInsert($con);
				} else {
					$this->doUpdate($con);
				}
				$affectedRows += 1;
				$this->resetModified();
			}

			if ($this->shopKitProductsScheduledForDeletion !== null) {
				if (!$this->shopKitProductsScheduledForDeletion->isEmpty()) {
					ShopKitProductQuery::create()
						->filterByPrimaryKeys($this->shopKitProductsScheduledForDeletion->getPrimaryKeys(false))
						->delete($con);
					$this->shopKitProductsScheduledForDeletion = null;
				}
			}

			if ($this->collShopKitProducts !== null) {
				foreach ($this->collShopKitProducts as $referrerFK) {
					if (!$referrerFK->isDeleted()) {
						$affectedRows += $referrerFK->save($con);
					}
				}
			}

			if ($this->sProductVariantsI18nsScheduledForDeletion !== null) {
				if (!$this->sProductVariantsI18nsScheduledForDeletion->isEmpty()) {
					SProductVariantsI18nQuery::create()
						->filterByPrimaryKeys($this->sProductVariantsI18nsScheduledForDeletion->getPrimaryKeys(false))
						->delete($con);
					$this->sProductVariantsI18nsScheduledForDeletion = null;
				}
			}

			if ($this->collSProductVariantsI18ns !== null) {
				foreach ($this->collSProductVariantsI18ns as $referrerFK) {
					if (!$referrerFK->isDeleted()) {
						$affectedRows += $referrerFK->save($con);
					}
				}
			}

			if ($this->sNotificationssScheduledForDeletion !== null) {
				if (!$this->sNotificationssScheduledForDeletion->isEmpty()) {
					SNotificationsQuery::create()
						->filterByPrimaryKeys($this->sNotificationssScheduledForDeletion->getPrimaryKeys(false))
						->delete($con);
					$this->sNotificationssScheduledForDeletion = null;
				}
			}

			if ($this->collSNotificationss !== null) {
				foreach ($this->collSNotificationss as $referrerFK) {
					if (!$referrerFK->isDeleted()) {
						$affectedRows += $referrerFK->save($con);
					}
				}
			}

			if ($this->sOrderProductssScheduledForDeletion !== null) {
				if (!$this->sOrderProductssScheduledForDeletion->isEmpty()) {
					SOrderProductsQuery::create()
						->filterByPrimaryKeys($this->sOrderProductssScheduledForDeletion->getPrimaryKeys(false))
						->delete($con);
					$this->sOrderProductssScheduledForDeletion = null;
				}
			}

			if ($this->collSOrderProductss !== null) {
				foreach ($this->collSOrderProductss as $referrerFK) {
					if (!$referrerFK->isDeleted()) {
						$affectedRows += $referrerFK->save($con);
					}
				}
			}

			$this->alreadyInSave = false;

		}
		return $affectedRows;
	} // doSave()

	/**
	 * Insert the row in the database.
	 *
	 * @param      PropelPDO $con
	 *
	 * @throws     PropelException
	 * @see        doSave()
	 */
	protected function doInsert(PropelPDO $con)
	{
		$modifiedColumns = array();
		$index = 0;

		$this->modifiedColumns[] = SProductVariantsPeer::ID;
		if (null !== $this->id) {
			throw new PropelException('Cannot insert a value for auto-increment primary key (' . SProductVariantsPeer::ID . ')');
		}

		 // check the columns in natural order for more readable SQL queries
		if ($this->isColumnModified(SProductVariantsPeer::ID)) {
			$modifiedColumns[':p' . $index++]  = '`ID`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::EXTERNAL_ID)) {
			$modifiedColumns[':p' . $index++]  = '`EXTERNAL_ID`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::PRODUCT_ID)) {
			$modifiedColumns[':p' . $index++]  = '`PRODUCT_ID`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::PRICE)) {
			$modifiedColumns[':p' . $index++]  = '`PRICE`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::NUMBER)) {
			$modifiedColumns[':p' . $index++]  = '`NUMBER`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::STOCK)) {
			$modifiedColumns[':p' . $index++]  = '`STOCK`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::MAINIMAGE)) {
			$modifiedColumns[':p' . $index++]  = '`MAINIMAGE`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::SMALLIMAGE)) {
			$modifiedColumns[':p' . $index++]  = '`SMALLIMAGE`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::POSITION)) {
			$modifiedColumns[':p' . $index++]  = '`POSITION`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::CURRENCY)) {
			$modifiedColumns[':p' . $index++]  = '`CURRENCY`';
		}
		if ($this->isColumnModified(SProductVariantsPeer::PRICE_IN_MAIN)) {
			$modifiedColumns[':p' . $index++]  = '`PRICE_IN_MAIN`';
		}

		$sql = sprintf(
			'INSERT INTO `shop_product_variants` (%s) VALUES (%s)',
			implode(', ', $modifiedColumns),
			implode(', ', array_keys($modifiedColumns))
		);

		try {
			$stmt = $con->prepare($sql);
			foreach ($modifiedColumns as $identifier => $columnName) {
				switch ($columnName) {
					case '`ID`':						
						$stmt->bindValue($identifier, $this->id, PDO::PARAM_INT);
						break;
					case '`EXTERNAL_ID`':						
						$stmt->bindValue($identifier, $this->external_id, PDO::PARAM_STR);
						break;
					case '`PRODUCT_ID`':						
						$stmt->bindValue($identifier, $this->product_id, PDO::PARAM_INT);
						break;
					case '`PRICE`':						
						$stmt->bindValue($identifier, $this->price, PDO::PARAM_STR);
						break;
					case '`NUMBER`':						
						$stmt->bindValue($identifier, $this->number, PDO::PARAM_STR);
						break;
					case '`STOCK`':						
						$stmt->bindValue($identifier, $this->stock, PDO::PARAM_INT);
						break;
					case '`MAINIMAGE`':						
						$stmt->bindValue($identifier, $this->mainimage, PDO::PARAM_STR);
						break;
					case '`SMALLIMAGE`':						
						$stmt->bindValue($identifier, $this->smallimage, PDO::PARAM_STR);
						break;
					case '`POSITION`':						
						$stmt->bindValue($identifier, $this->position, PDO::PARAM_INT);
						break;
					case '`CURRENCY`':						
						$stmt->bindValue($identifier, $this->currency, PDO::PARAM_INT);
						break;
					case '`PRICE_IN_MAIN`':						
						$stmt->bindValue($identifier, $this->price_in_main, PDO::PARAM_STR);
						break;
				}
			}
			$stmt->execute();
		} catch (Exception $e) {
			Propel::log($e->getMessage(), Propel::LOG_ERR);
			throw new PropelException(sprintf('Unable to execute INSERT statement [%s]', $sql), $e);
		}

		try {
			$pk = $con->lastInsertId();
		} catch (Exception $e) {
			throw new PropelException('Unable to get autoincrement id.', $e);
		}
		$this->setId($pk);

		$this->setNew(false);
	}

	/**
	 * Update the row in the database.
	 *
	 * @param      PropelPDO $con
	 *
	 * @see        doSave()
	 */
	protected function doUpdate(PropelPDO $con)
	{
		$selectCriteria = $this->buildPkeyCriteria();
		$valuesCriteria = $this->buildCriteria();
		BasePeer::doUpdate($selectCriteria, $valuesCriteria, $con);
	}

	/**
	 * Array of ValidationFailed objects.
	 * @var        array ValidationFailed[]
	 */
	protected $validationFailures = array();

	/**
	 * Gets any ValidationFailed objects that resulted from last call to validate().
	 *
	 *
	 * @return     array ValidationFailed[]
	 * @see        validate()
	 */
	public function getValidationFailures()
	{
		return $this->validationFailures;
	}

	/**
	 * Validates the objects modified field values and all objects related to this table.
	 *
	 * If $columns is either a column name or an array of column names
	 * only those columns are validated.
	 *
	 * @param      mixed $columns Column name or an array of column names.
	 * @return     boolean Whether all columns pass validation.
	 * @see        doValidate()
	 * @see        getValidationFailures()
	 */
	public function validate($columns = null)
	{
		$res = $this->doValidate($columns);
		if ($res === true) {
			$this->validationFailures = array();
			return true;
		} else {
			$this->validationFailures = $res;
			return false;
		}
	}

	/**
	 * This function performs the validation work for complex object models.
	 *
	 * In addition to checking the current object, all related objects will
	 * also be validated.  If all pass then <code>true</code> is returned; otherwise
	 * an aggreagated array of ValidationFailed objects will be returned.
	 *
	 * @param      array $columns Array of column names to validate.
	 * @return     mixed <code>true</code> if all validations pass; array of <code>ValidationFailed</code> objets otherwise.
	 */
	protected function doValidate($columns = null)
	{
		if (!$this->alreadyInValidation) {
			$this->alreadyInValidation = true;
			$retval = null;

			$failureMap = array();


			// We call the validate method on the following object(s) if they
			// were passed to this object by their coresponding set
			// method.  This object relates to these object(s) by a
			// foreign key reference.

			if ($this->aSProducts !== null) {
				if (!$this->aSProducts->validate($columns)) {
					$failureMap = array_merge($failureMap, $this->aSProducts->getValidationFailures());
				}
			}

			if ($this->aSCurrencies !== null) {
				if (!$this->aSCurrencies->validate($columns)) {
					$failureMap = array_merge($failureMap, $this->aSCurrencies->getValidationFailures());
				}
			}


			if (($retval = SProductVariantsPeer::doValidate($this, $columns)) !== true) {
				$failureMap = array_merge($failureMap, $retval);
			}


				if ($this->collShopKitProducts !== null) {
					foreach ($this->collShopKitProducts as $referrerFK) {
						if (!$referrerFK->validate($columns)) {
							$failureMap = array_merge($failureMap, $referrerFK->getValidationFailures());
						}
					}
				}

				if ($this->collSProductVariantsI18ns !== null) {
					foreach ($this->collSProductVariantsI18ns as $referrerFK) {
						if (!$referrerFK->validate($columns)) {
							$failureMap = array_merge($failureMap, $referrerFK->getValidationFailures());
						}
					}
				}

				if ($this->collSNotificationss !== null) {
					foreach ($this->collSNotificationss as $referrerFK) {
						if (!$referrerFK->validate($columns)) {
							$failureMap = array_merge($failureMap, $referrerFK->getValidationFailures());
						}
					}
				}

				if ($this->collSOrderProductss !== null) {
					foreach ($this->collSOrderProductss as $referrerFK) {
						if (!$referrerFK->validate($columns)) {
							$failureMap = array_merge($failureMap, $referrerFK->getValidationFailures());
						}
					}
				}


			$this->alreadyInValidation = false;
		}

		return (!empty($failureMap) ? $failureMap : true);
	}

	/**
	 * Retrieves a field from the object by name passed in as a string.
	 *
	 * @param      string $name name
	 * @param      string $type The type of fieldname the $name is of:
	 *                     one of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                     BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM
	 * @return     mixed Value of field.
	 */
	public function getByName($name, $type = BasePeer::TYPE_PHPNAME)
	{
		$pos = SProductVariantsPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
		$field = $this->getByPosition($pos);
		return $field;
	}

	/**
	 * Retrieves a field from the object by Position as specified in the xml schema.
	 * Zero-based.
	 *
	 * @param      int $pos position in xml schema
	 * @return     mixed Value of field at $pos
	 */
	public function getByPosition($pos)
	{
		switch($pos) {
			case 0:
				return $this->getId();
				break;
			case 1:
				return $this->getExternalId();
				break;
			case 2:
				return $this->getProductId();
				break;
			case 3:
				return $this->getPrice();
				break;
			case 4:
				return $this->getNumber();
				break;
			case 5:
				return $this->getStock();
				break;
			case 6:
				return $this->getMainimage();
				break;
			case 7:
				return $this->getSmallimage();
				break;
			case 8:
				return $this->getPosition();
				break;
			case 9:
				return $this->getCurrency();
				break;
			case 10:
				return $this->getPriceInMain();
				break;
			default:
				return null;
				break;
		} // switch()
	}

	/**
	 * Exports the object as an array.
	 *
	 * You can specify the key type of the array by passing one of the class
	 * type constants.
	 *
	 * @param     string  $keyType (optional) One of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME,
	 *                    BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM.
	 *                    Defaults to BasePeer::TYPE_PHPNAME.
	 * @param     boolean $includeLazyLoadColumns (optional) Whether to include lazy loaded columns. Defaults to TRUE.
	 * @param     array $alreadyDumpedObjects List of objects to skip to avoid recursion
	 * @param     boolean $includeForeignObjects (optional) Whether to include hydrated related objects. Default to FALSE.
	 *
	 * @return    array an associative array containing the field names (as keys) and field values
	 */
	public function toArray($keyType = BasePeer::TYPE_PHPNAME, $includeLazyLoadColumns = true, $alreadyDumpedObjects = array(), $includeForeignObjects = false)
	{
		if (isset($alreadyDumpedObjects['SProductVariants'][$this->getPrimaryKey()])) {
			return '*RECURSION*';
		}
		$alreadyDumpedObjects['SProductVariants'][$this->getPrimaryKey()] = true;
		$keys = SProductVariantsPeer::getFieldNames($keyType);
		$result = array(
			$keys[0] => $this->getId(),
			$keys[1] => $this->getExternalId(),
			$keys[2] => $this->getProductId(),
			$keys[3] => $this->getPrice(),
			$keys[4] => $this->getNumber(),
			$keys[5] => $this->getStock(),
			$keys[6] => $this->getMainimage(),
			$keys[7] => $this->getSmallimage(),
			$keys[8] => $this->getPosition(),
			$keys[9] => $this->getCurrency(),
			$keys[10] => $this->getPriceInMain(),
		);
		if ($includeForeignObjects) {
			if (null !== $this->aSProducts) {
				$result['SProducts'] = $this->aSProducts->toArray($keyType, $includeLazyLoadColumns,  $alreadyDumpedObjects, true);
			}
			if (null !== $this->aSCurrencies) {
				$result['SCurrencies'] = $this->aSCurrencies->toArray($keyType, $includeLazyLoadColumns,  $alreadyDumpedObjects, true);
			}
			if (null !== $this->collShopKitProducts) {
				$result['ShopKitProducts'] = $this->collShopKitProducts->toArray(null, true, $keyType, $includeLazyLoadColumns, $alreadyDumpedObjects);
			}
			if (null !== $this->collSProductVariantsI18ns) {
				$result['SProductVariantsI18ns'] = $this->collSProductVariantsI18ns->toArray(null, true, $keyType, $includeLazyLoadColumns, $alreadyDumpedObjects);
			}
			if (null !== $this->collSNotificationss) {
				$result['SNotificationss'] = $this->collSNotificationss->toArray(null, true, $keyType, $includeLazyLoadColumns, $alreadyDumpedObjects);
			}
			if (null !== $this->collSOrderProductss) {
				$result['SOrderProductss'] = $this->collSOrderProductss->toArray(null, true, $keyType, $includeLazyLoadColumns, $alreadyDumpedObjects);
			}
		}
		return $result;
	}

	/**
	 * Sets a field from the object by name passed in as a string.
	 *
	 * @param      string $name peer name
	 * @param      mixed $value field value
	 * @param      string $type The type of fieldname the $name is of:
	 *                     one of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME
	 *                     BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM
	 * @return     void
	 */
	public function setByName($name, $value, $type = BasePeer::TYPE_PHPNAME)
	{
		$pos = SProductVariantsPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
		return $this->setByPosition($pos, $value);
	}

	/**
	 * Sets a field from the object by Position as specified in the xml schema.
	 * Zero-based.
	 *
	 * @param      int $pos position in xml schema
	 * @param      mixed $value field value
	 * @return     void
	 */
	public function setByPosition($pos, $value)
	{
		switch($pos) {
			case 0:
				$this->setId($value);
				break;
			case 1:
				$this->setExternalId($value);
				break;
			case 2:
				$this->setProductId($value);
				break;
			case 3:
				$this->setPrice($value);
				break;
			case 4:
				$this->setNumber($value);
				break;
			case 5:
				$this->setStock($value);
				break;
			case 6:
				$this->setMainimage($value);
				break;
			case 7:
				$this->setSmallimage($value);
				break;
			case 8:
				$this->setPosition($value);
				break;
			case 9:
				$this->setCurrency($value);
				break;
			case 10:
				$this->setPriceInMain($value);
				break;
		} // switch()
	}

	/**
	 * Populates the object using an array.
	 *
	 * This is particularly useful when populating an object from one of the
	 * request arrays (e.g. $_POST).  This method goes through the column
	 * names, checking to see whether a matching key exists in populated
	 * array. If so the setByName() method is called for that column.
	 *
	 * You can specify the key type of the array by additionally passing one
	 * of the class type constants BasePeer::TYPE_PHPNAME, BasePeer::TYPE_STUDLYPHPNAME,
	 * BasePeer::TYPE_COLNAME, BasePeer::TYPE_FIELDNAME, BasePeer::TYPE_NUM.
	 * The default key type is the column's phpname (e.g. 'AuthorId')
	 *
	 * @param      array  $arr     An array to populate the object from.
	 * @param      string $keyType The type of keys the array uses.
	 * @return     void
	 */
	public function fromArray($arr, $keyType = BasePeer::TYPE_PHPNAME)
	{
		$keys = SProductVariantsPeer::getFieldNames($keyType);

		if (array_key_exists($keys[0], $arr)) $this->setId($arr[$keys[0]]);
		if (array_key_exists($keys[1], $arr)) $this->setExternalId($arr[$keys[1]]);
		if (array_key_exists($keys[2], $arr)) $this->setProductId($arr[$keys[2]]);
		if (array_key_exists($keys[3], $arr)) $this->setPrice($arr[$keys[3]]);
		if (array_key_exists($keys[4], $arr)) $this->setNumber($arr[$keys[4]]);
		if (array_key_exists($keys[5], $arr)) $this->setStock($arr[$keys[5]]);
		if (array_key_exists($keys[6], $arr)) $this->setMainimage($arr[$keys[6]]);
		if (array_key_exists($keys[7], $arr)) $this->setSmallimage($arr[$keys[7]]);
		if (array_key_exists($keys[8], $arr)) $this->setPosition($arr[$keys[8]]);
		if (array_key_exists($keys[9], $arr)) $this->setCurrency($arr[$keys[9]]);
		if (array_key_exists($keys[10], $arr)) $this->setPriceInMain($arr[$keys[10]]);
	}

	/**
	 * Build a Criteria object containing the values of all modified columns in this object.
	 *
	 * @return     Criteria The Criteria object containing all modified values.
	 */
	public function buildCriteria()
	{
		$criteria = new Criteria(SProductVariantsPeer::DATABASE_NAME);

		if ($this->isColumnModified(SProductVariantsPeer::ID)) $criteria->add(SProductVariantsPeer::ID, $this->id);
		if ($this->isColumnModified(SProductVariantsPeer::EXTERNAL_ID)) $criteria->add(SProductVariantsPeer::EXTERNAL_ID, $this->external_id);
		if ($this->isColumnModified(SProductVariantsPeer::PRODUCT_ID)) $criteria->add(SProductVariantsPeer::PRODUCT_ID, $this->product_id);
		if ($this->isColumnModified(SProductVariantsPeer::PRICE)) $criteria->add(SProductVariantsPeer::PRICE, $this->price);
		if ($this->isColumnModified(SProductVariantsPeer::NUMBER)) $criteria->add(SProductVariantsPeer::NUMBER, $this->number);
		if ($this->isColumnModified(SProductVariantsPeer::STOCK)) $criteria->add(SProductVariantsPeer::STOCK, $this->stock);
		if ($this->isColumnModified(SProductVariantsPeer::MAINIMAGE)) $criteria->add(SProductVariantsPeer::MAINIMAGE, $this->mainimage);
		if ($this->isColumnModified(SProductVariantsPeer::SMALLIMAGE)) $criteria->add(SProductVariantsPeer::SMALLIMAGE, $this->smallimage);
		if ($this->isColumnModified(SProductVariantsPeer::POSITION)) $criteria->add(SProductVariantsPeer::POSITION, $this->position);
		if ($this->isColumnModified(SProductVariantsPeer::CURRENCY)) $criteria->add(SProductVariantsPeer::CURRENCY, $this->currency);
		if ($this->isColumnModified(SProductVariantsPeer::PRICE_IN_MAIN)) $criteria->add(SProductVariantsPeer::PRICE_IN_MAIN, $this->price_in_main);

		return $criteria;
	}

	/**
	 * Builds a Criteria object containing the primary key for this object.
	 *
	 * Unlike buildCriteria() this method includes the primary key values regardless
	 * of whether or not they have been modified.
	 *
	 * @return     Criteria The Criteria object containing value(s) for primary key(s).
	 */
	public function buildPkeyCriteria()
	{
		$criteria = new Criteria(SProductVariantsPeer::DATABASE_NAME);
		$criteria->add(SProductVariantsPeer::ID, $this->id);

		return $criteria;
	}

	/**
	 * Returns the primary key for this object (row).
	 * @return     int
	 */
	public function getPrimaryKey()
	{
		return $this->getId();
	}

	/**
	 * Generic method to set the primary key (id column).
	 *
	 * @param      int $key Primary key.
	 * @return     void
	 */
	public function setPrimaryKey($key)
	{
		$this->setId($key);
	}

	/**
	 * Returns true if the primary key for this object is null.
	 * @return     boolean
	 */
	public function isPrimaryKeyNull()
	{
		return null === $this->getId();
	}

	/**
	 * Sets contents of passed object to values from current object.
	 *
	 * If desired, this method can also make copies of all associated (fkey referrers)
	 * objects.
	 *
	 * @param      object $copyObj An object of SProductVariants (or compatible) type.
	 * @param      boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
	 * @param      boolean $makeNew Whether to reset autoincrement PKs and make the object new.
	 * @throws     PropelException
	 */
	public function copyInto($copyObj, $deepCopy = false, $makeNew = true)
	{
		$copyObj->setExternalId($this->getExternalId());
		$copyObj->setProductId($this->getProductId());
		$copyObj->setPrice($this->getPrice());
		$copyObj->setNumber($this->getNumber());
		$copyObj->setStock($this->getStock());
		$copyObj->setMainimage($this->getMainimage());
		$copyObj->setSmallimage($this->getSmallimage());
		$copyObj->setPosition($this->getPosition());
		$copyObj->setCurrency($this->getCurrency());
		$copyObj->setPriceInMain($this->getPriceInMain());

		if ($deepCopy && !$this->startCopy) {
			// important: temporarily setNew(false) because this affects the behavior of
			// the getter/setter methods for fkey referrer objects.
			$copyObj->setNew(false);
			// store object hash to prevent cycle
			$this->startCopy = true;

			foreach ($this->getShopKitProducts() as $relObj) {
				if ($relObj !== $this) {  // ensure that we don't try to copy a reference to ourselves
					$copyObj->addShopKitProduct($relObj->copy($deepCopy));
				}
			}

			foreach ($this->getSProductVariantsI18ns() as $relObj) {
				if ($relObj !== $this) {  // ensure that we don't try to copy a reference to ourselves
					$copyObj->addSProductVariantsI18n($relObj->copy($deepCopy));
				}
			}

			foreach ($this->getSNotificationss() as $relObj) {
				if ($relObj !== $this) {  // ensure that we don't try to copy a reference to ourselves
					$copyObj->addSNotifications($relObj->copy($deepCopy));
				}
			}

			foreach ($this->getSOrderProductss() as $relObj) {
				if ($relObj !== $this) {  // ensure that we don't try to copy a reference to ourselves
					$copyObj->addSOrderProducts($relObj->copy($deepCopy));
				}
			}

			//unflag object copy
			$this->startCopy = false;
		} // if ($deepCopy)

		if ($makeNew) {
			$copyObj->setNew(true);
			$copyObj->setId(NULL); // this is a auto-increment column, so set to default value
		}
	}

	/**
	 * Makes a copy of this object that will be inserted as a new row in table when saved.
	 * It creates a new object filling in the simple attributes, but skipping any primary
	 * keys that are defined for the table.
	 *
	 * If desired, this method can also make copies of all associated (fkey referrers)
	 * objects.
	 *
	 * @param      boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
	 * @return     SProductVariants Clone of current object.
	 * @throws     PropelException
	 */
	public function copy($deepCopy = false)
	{
		// we use get_class(), because this might be a subclass
		$clazz = get_class($this);
		$copyObj = new $clazz();
		$this->copyInto($copyObj, $deepCopy);
		return $copyObj;
	}

	/**
	 * Returns a peer instance associated with this om.
	 *
	 * Since Peer classes are not to have any instance attributes, this method returns the
	 * same instance for all member of this class. The method could therefore
	 * be static, but this would prevent one from overriding the behavior.
	 *
	 * @return     SProductVariantsPeer
	 */
	public function getPeer()
	{
		if (self::$peer === null) {
			self::$peer = new SProductVariantsPeer();
		}
		return self::$peer;
	}

	/**
	 * Declares an association between this object and a SProducts object.
	 *
	 * @param      SProducts $v
	 * @return     SProductVariants The current object (for fluent API support)
	 * @throws     PropelException
	 */
	public function setSProducts(SProducts $v = null)
	{
		if ($v === null) {
			$this->setProductId(NULL);
		} else {
			$this->setProductId($v->getId());
		}

		$this->aSProducts = $v;

		// Add binding for other direction of this n:n relationship.
		// If this object has already been added to the SProducts object, it will not be re-added.
		if ($v !== null) {
			$v->addProductVariant($this);
		}

		return $this;
	}


	/**
	 * Get the associated SProducts object
	 *
	 * @param      PropelPDO Optional Connection object.
	 * @return     SProducts The associated SProducts object.
	 * @throws     PropelException
	 */
	public function getSProducts(PropelPDO $con = null)
	{
		if ($this->aSProducts === null && ($this->product_id !== null)) {
			$this->aSProducts = SProductsQuery::create()->findPk($this->product_id, $con);
			/* The following can be used additionally to
				guarantee the related object contains a reference
				to this object.  This level of coupling may, however, be
				undesirable since it could result in an only partially populated collection
				in the referenced object.
				$this->aSProducts->addProductVariants($this);
			 */
		}
		return $this->aSProducts;
	}

	/**
	 * Declares an association between this object and a SCurrencies object.
	 *
	 * @param      SCurrencies $v
	 * @return     SProductVariants The current object (for fluent API support)
	 * @throws     PropelException
	 */
	public function setSCurrencies(SCurrencies $v = null)
	{
		if ($v === null) {
			$this->setCurrency(NULL);
		} else {
			$this->setCurrency($v->getId());
		}

		$this->aSCurrencies = $v;

		// Add binding for other direction of this n:n relationship.
		// If this object has already been added to the SCurrencies object, it will not be re-added.
		if ($v !== null) {
			$v->addCurrency($this);
		}

		return $this;
	}


	/**
	 * Get the associated SCurrencies object
	 *
	 * @param      PropelPDO Optional Connection object.
	 * @return     SCurrencies The associated SCurrencies object.
	 * @throws     PropelException
	 */
	public function getSCurrencies(PropelPDO $con = null)
	{
		if ($this->aSCurrencies === null && ($this->currency !== null)) {
			$this->aSCurrencies = SCurrenciesQuery::create()->findPk($this->currency, $con);
			/* The following can be used additionally to
				guarantee the related object contains a reference
				to this object.  This level of coupling may, however, be
				undesirable since it could result in an only partially populated collection
				in the referenced object.
				$this->aSCurrencies->addCurrencys($this);
			 */
		}
		return $this->aSCurrencies;
	}


	/**
	 * Initializes a collection based on the name of a relation.
	 * Avoids crafting an 'init[$relationName]s' method name
	 * that wouldn't work when StandardEnglishPluralizer is used.
	 *
	 * @param      string $relationName The name of the relation to initialize
	 * @return     void
	 */
	public function initRelation($relationName)
	{
		if ('ShopKitProduct' == $relationName) {
			return $this->initShopKitProducts();
		}
		if ('SProductVariantsI18n' == $relationName) {
			return $this->initSProductVariantsI18ns();
		}
		if ('SNotifications' == $relationName) {
			return $this->initSNotificationss();
		}
		if ('SOrderProducts' == $relationName) {
			return $this->initSOrderProductss();
		}
	}

	/**
	 * Clears out the collShopKitProducts collection
	 *
	 * This does not modify the database; however, it will remove any associated objects, causing
	 * them to be refetched by subsequent calls to accessor method.
	 *
	 * @return     void
	 * @see        addShopKitProducts()
	 */
	public function clearShopKitProducts()
	{
		$this->collShopKitProducts = null; // important to set this to NULL since that means it is uninitialized
	}

	/**
	 * Initializes the collShopKitProducts collection.
	 *
	 * By default this just sets the collShopKitProducts collection to an empty array (like clearcollShopKitProducts());
	 * however, you may wish to override this method in your stub class to provide setting appropriate
	 * to your application -- for example, setting the initial array to the values stored in database.
	 *
	 * @param      boolean $overrideExisting If set to true, the method call initializes
	 *                                        the collection even if it is not empty
	 *
	 * @return     void
	 */
	public function initShopKitProducts($overrideExisting = true)
	{
		if (null !== $this->collShopKitProducts && !$overrideExisting) {
			return;
		}
		$this->collShopKitProducts = new PropelObjectCollection();
		$this->collShopKitProducts->setModel('ShopKitProduct');
	}

	/**
	 * Gets an array of ShopKitProduct objects which contain a foreign key that references this object.
	 *
	 * If the $criteria is not null, it is used to always fetch the results from the database.
	 * Otherwise the results are fetched from the database the first time, then cached.
	 * Next time the same method is called without $criteria, the cached collection is returned.
	 * If this SProductVariants is new, it will return
	 * an empty collection or the current collection; the criteria is ignored on a new object.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @return     PropelCollection|array ShopKitProduct[] List of ShopKitProduct objects
	 * @throws     PropelException
	 */
	public function getShopKitProducts($criteria = null, PropelPDO $con = null)
	{
		if(null === $this->collShopKitProducts || null !== $criteria) {
			if ($this->isNew() && null === $this->collShopKitProducts) {
				// return empty collection
				$this->initShopKitProducts();
			} else {
				$collShopKitProducts = ShopKitProductQuery::create(null, $criteria)
					->filterBySProductVariants($this)
					->find($con);
				if (null !== $criteria) {
					return $collShopKitProducts;
				}
				$this->collShopKitProducts = $collShopKitProducts;
			}
		}
		return $this->collShopKitProducts;
	}

	/**
	 * Sets a collection of ShopKitProduct objects related by a one-to-many relationship
	 * to the current object.
	 * It will also schedule objects for deletion based on a diff between old objects (aka persisted)
	 * and new objects from the given Propel collection.
	 *
	 * @param      PropelCollection $shopKitProducts A Propel collection.
	 * @param      PropelPDO $con Optional connection object
	 */
	public function setShopKitProducts(PropelCollection $shopKitProducts, PropelPDO $con = null)
	{
		$this->shopKitProductsScheduledForDeletion = $this->getShopKitProducts(new Criteria(), $con)->diff($shopKitProducts);

		foreach ($shopKitProducts as $shopKitProduct) {
			// Fix issue with collection modified by reference
			if ($shopKitProduct->isNew()) {
				$shopKitProduct->setSProductVariants($this);
			}
			$this->addShopKitProduct($shopKitProduct);
		}

		$this->collShopKitProducts = $shopKitProducts;
	}

	/**
	 * Returns the number of related ShopKitProduct objects.
	 *
	 * @param      Criteria $criteria
	 * @param      boolean $distinct
	 * @param      PropelPDO $con
	 * @return     int Count of related ShopKitProduct objects.
	 * @throws     PropelException
	 */
	public function countShopKitProducts(Criteria $criteria = null, $distinct = false, PropelPDO $con = null)
	{
		if(null === $this->collShopKitProducts || null !== $criteria) {
			if ($this->isNew() && null === $this->collShopKitProducts) {
				return 0;
			} else {
				$query = ShopKitProductQuery::create(null, $criteria);
				if($distinct) {
					$query->distinct();
				}
				return $query
					->filterBySProductVariants($this)
					->count($con);
			}
		} else {
			return count($this->collShopKitProducts);
		}
	}

	/**
	 * Method called to associate a ShopKitProduct object to this object
	 * through the ShopKitProduct foreign key attribute.
	 *
	 * @param      ShopKitProduct $l ShopKitProduct
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function addShopKitProduct(ShopKitProduct $l)
	{
		if ($this->collShopKitProducts === null) {
			$this->initShopKitProducts();
		}
		if (!$this->collShopKitProducts->contains($l)) { // only add it if the **same** object is not already associated
			$this->doAddShopKitProduct($l);
		}

		return $this;
	}

	/**
	 * @param	ShopKitProduct $shopKitProduct The shopKitProduct object to add.
	 */
	protected function doAddShopKitProduct($shopKitProduct)
	{
		$this->collShopKitProducts[]= $shopKitProduct;
		$shopKitProduct->setSProductVariants($this);
	}


	/**
	 * If this collection has already been initialized with
	 * an identical criteria, it returns the collection.
	 * Otherwise if this SProductVariants is new, it will return
	 * an empty collection; or if this SProductVariants has previously
	 * been saved, it will retrieve related ShopKitProducts from storage.
	 *
	 * This method is protected by default in order to keep the public
	 * api reasonable.  You can provide public methods for those you
	 * actually need in SProductVariants.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @param      string $join_behavior optional join type to use (defaults to Criteria::LEFT_JOIN)
	 * @return     PropelCollection|array ShopKitProduct[] List of ShopKitProduct objects
	 */
	public function getShopKitProductsJoinSProducts($criteria = null, $con = null, $join_behavior = Criteria::LEFT_JOIN)
	{
		$query = ShopKitProductQuery::create(null, $criteria);
		$query->joinWith('SProducts', $join_behavior);

		return $this->getShopKitProducts($query, $con);
	}


	/**
	 * If this collection has already been initialized with
	 * an identical criteria, it returns the collection.
	 * Otherwise if this SProductVariants is new, it will return
	 * an empty collection; or if this SProductVariants has previously
	 * been saved, it will retrieve related ShopKitProducts from storage.
	 *
	 * This method is protected by default in order to keep the public
	 * api reasonable.  You can provide public methods for those you
	 * actually need in SProductVariants.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @param      string $join_behavior optional join type to use (defaults to Criteria::LEFT_JOIN)
	 * @return     PropelCollection|array ShopKitProduct[] List of ShopKitProduct objects
	 */
	public function getShopKitProductsJoinShopKit($criteria = null, $con = null, $join_behavior = Criteria::LEFT_JOIN)
	{
		$query = ShopKitProductQuery::create(null, $criteria);
		$query->joinWith('ShopKit', $join_behavior);

		return $this->getShopKitProducts($query, $con);
	}

	/**
	 * Clears out the collSProductVariantsI18ns collection
	 *
	 * This does not modify the database; however, it will remove any associated objects, causing
	 * them to be refetched by subsequent calls to accessor method.
	 *
	 * @return     void
	 * @see        addSProductVariantsI18ns()
	 */
	public function clearSProductVariantsI18ns()
	{
		$this->collSProductVariantsI18ns = null; // important to set this to NULL since that means it is uninitialized
	}

	/**
	 * Initializes the collSProductVariantsI18ns collection.
	 *
	 * By default this just sets the collSProductVariantsI18ns collection to an empty array (like clearcollSProductVariantsI18ns());
	 * however, you may wish to override this method in your stub class to provide setting appropriate
	 * to your application -- for example, setting the initial array to the values stored in database.
	 *
	 * @param      boolean $overrideExisting If set to true, the method call initializes
	 *                                        the collection even if it is not empty
	 *
	 * @return     void
	 */
	public function initSProductVariantsI18ns($overrideExisting = true)
	{
		if (null !== $this->collSProductVariantsI18ns && !$overrideExisting) {
			return;
		}
		$this->collSProductVariantsI18ns = new PropelObjectCollection();
		$this->collSProductVariantsI18ns->setModel('SProductVariantsI18n');
	}

	/**
	 * Gets an array of SProductVariantsI18n objects which contain a foreign key that references this object.
	 *
	 * If the $criteria is not null, it is used to always fetch the results from the database.
	 * Otherwise the results are fetched from the database the first time, then cached.
	 * Next time the same method is called without $criteria, the cached collection is returned.
	 * If this SProductVariants is new, it will return
	 * an empty collection or the current collection; the criteria is ignored on a new object.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @return     PropelCollection|array SProductVariantsI18n[] List of SProductVariantsI18n objects
	 * @throws     PropelException
	 */
	public function getSProductVariantsI18ns($criteria = null, PropelPDO $con = null)
	{
		if(null === $this->collSProductVariantsI18ns || null !== $criteria) {
			if ($this->isNew() && null === $this->collSProductVariantsI18ns) {
				// return empty collection
				$this->initSProductVariantsI18ns();
			} else {
				$collSProductVariantsI18ns = SProductVariantsI18nQuery::create(null, $criteria)
					->filterBySProductVariants($this)
					->find($con);
				if (null !== $criteria) {
					return $collSProductVariantsI18ns;
				}
				$this->collSProductVariantsI18ns = $collSProductVariantsI18ns;
			}
		}
		return $this->collSProductVariantsI18ns;
	}

	/**
	 * Sets a collection of SProductVariantsI18n objects related by a one-to-many relationship
	 * to the current object.
	 * It will also schedule objects for deletion based on a diff between old objects (aka persisted)
	 * and new objects from the given Propel collection.
	 *
	 * @param      PropelCollection $sProductVariantsI18ns A Propel collection.
	 * @param      PropelPDO $con Optional connection object
	 */
	public function setSProductVariantsI18ns(PropelCollection $sProductVariantsI18ns, PropelPDO $con = null)
	{
		$this->sProductVariantsI18nsScheduledForDeletion = $this->getSProductVariantsI18ns(new Criteria(), $con)->diff($sProductVariantsI18ns);

		foreach ($sProductVariantsI18ns as $sProductVariantsI18n) {
			// Fix issue with collection modified by reference
			if ($sProductVariantsI18n->isNew()) {
				$sProductVariantsI18n->setSProductVariants($this);
			}
			$this->addSProductVariantsI18n($sProductVariantsI18n);
		}

		$this->collSProductVariantsI18ns = $sProductVariantsI18ns;
	}

	/**
	 * Returns the number of related SProductVariantsI18n objects.
	 *
	 * @param      Criteria $criteria
	 * @param      boolean $distinct
	 * @param      PropelPDO $con
	 * @return     int Count of related SProductVariantsI18n objects.
	 * @throws     PropelException
	 */
	public function countSProductVariantsI18ns(Criteria $criteria = null, $distinct = false, PropelPDO $con = null)
	{
		if(null === $this->collSProductVariantsI18ns || null !== $criteria) {
			if ($this->isNew() && null === $this->collSProductVariantsI18ns) {
				return 0;
			} else {
				$query = SProductVariantsI18nQuery::create(null, $criteria);
				if($distinct) {
					$query->distinct();
				}
				return $query
					->filterBySProductVariants($this)
					->count($con);
			}
		} else {
			return count($this->collSProductVariantsI18ns);
		}
	}

	/**
	 * Method called to associate a SProductVariantsI18n object to this object
	 * through the SProductVariantsI18n foreign key attribute.
	 *
	 * @param      SProductVariantsI18n $l SProductVariantsI18n
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function addSProductVariantsI18n(SProductVariantsI18n $l)
	{
		if ($l && $locale = $l->getLocale()) {
			$this->setLocale($locale);
			$this->currentTranslations[$locale] = $l;
		}
		if ($this->collSProductVariantsI18ns === null) {
			$this->initSProductVariantsI18ns();
		}
		if (!$this->collSProductVariantsI18ns->contains($l)) { // only add it if the **same** object is not already associated
			$this->doAddSProductVariantsI18n($l);
		}

		return $this;
	}

	/**
	 * @param	SProductVariantsI18n $sProductVariantsI18n The sProductVariantsI18n object to add.
	 */
	protected function doAddSProductVariantsI18n($sProductVariantsI18n)
	{
		$this->collSProductVariantsI18ns[]= $sProductVariantsI18n;
		$sProductVariantsI18n->setSProductVariants($this);
	}

	/**
	 * Clears out the collSNotificationss collection
	 *
	 * This does not modify the database; however, it will remove any associated objects, causing
	 * them to be refetched by subsequent calls to accessor method.
	 *
	 * @return     void
	 * @see        addSNotificationss()
	 */
	public function clearSNotificationss()
	{
		$this->collSNotificationss = null; // important to set this to NULL since that means it is uninitialized
	}

	/**
	 * Initializes the collSNotificationss collection.
	 *
	 * By default this just sets the collSNotificationss collection to an empty array (like clearcollSNotificationss());
	 * however, you may wish to override this method in your stub class to provide setting appropriate
	 * to your application -- for example, setting the initial array to the values stored in database.
	 *
	 * @param      boolean $overrideExisting If set to true, the method call initializes
	 *                                        the collection even if it is not empty
	 *
	 * @return     void
	 */
	public function initSNotificationss($overrideExisting = true)
	{
		if (null !== $this->collSNotificationss && !$overrideExisting) {
			return;
		}
		$this->collSNotificationss = new PropelObjectCollection();
		$this->collSNotificationss->setModel('SNotifications');
	}

	/**
	 * Gets an array of SNotifications objects which contain a foreign key that references this object.
	 *
	 * If the $criteria is not null, it is used to always fetch the results from the database.
	 * Otherwise the results are fetched from the database the first time, then cached.
	 * Next time the same method is called without $criteria, the cached collection is returned.
	 * If this SProductVariants is new, it will return
	 * an empty collection or the current collection; the criteria is ignored on a new object.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @return     PropelCollection|array SNotifications[] List of SNotifications objects
	 * @throws     PropelException
	 */
	public function getSNotificationss($criteria = null, PropelPDO $con = null)
	{
		if(null === $this->collSNotificationss || null !== $criteria) {
			if ($this->isNew() && null === $this->collSNotificationss) {
				// return empty collection
				$this->initSNotificationss();
			} else {
				$collSNotificationss = SNotificationsQuery::create(null, $criteria)
					->filterBySProductVariants($this)
					->find($con);
				if (null !== $criteria) {
					return $collSNotificationss;
				}
				$this->collSNotificationss = $collSNotificationss;
			}
		}
		return $this->collSNotificationss;
	}

	/**
	 * Sets a collection of SNotifications objects related by a one-to-many relationship
	 * to the current object.
	 * It will also schedule objects for deletion based on a diff between old objects (aka persisted)
	 * and new objects from the given Propel collection.
	 *
	 * @param      PropelCollection $sNotificationss A Propel collection.
	 * @param      PropelPDO $con Optional connection object
	 */
	public function setSNotificationss(PropelCollection $sNotificationss, PropelPDO $con = null)
	{
		$this->sNotificationssScheduledForDeletion = $this->getSNotificationss(new Criteria(), $con)->diff($sNotificationss);

		foreach ($sNotificationss as $sNotifications) {
			// Fix issue with collection modified by reference
			if ($sNotifications->isNew()) {
				$sNotifications->setSProductVariants($this);
			}
			$this->addSNotifications($sNotifications);
		}

		$this->collSNotificationss = $sNotificationss;
	}

	/**
	 * Returns the number of related SNotifications objects.
	 *
	 * @param      Criteria $criteria
	 * @param      boolean $distinct
	 * @param      PropelPDO $con
	 * @return     int Count of related SNotifications objects.
	 * @throws     PropelException
	 */
	public function countSNotificationss(Criteria $criteria = null, $distinct = false, PropelPDO $con = null)
	{
		if(null === $this->collSNotificationss || null !== $criteria) {
			if ($this->isNew() && null === $this->collSNotificationss) {
				return 0;
			} else {
				$query = SNotificationsQuery::create(null, $criteria);
				if($distinct) {
					$query->distinct();
				}
				return $query
					->filterBySProductVariants($this)
					->count($con);
			}
		} else {
			return count($this->collSNotificationss);
		}
	}

	/**
	 * Method called to associate a SNotifications object to this object
	 * through the SNotifications foreign key attribute.
	 *
	 * @param      SNotifications $l SNotifications
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function addSNotifications(SNotifications $l)
	{
		if ($this->collSNotificationss === null) {
			$this->initSNotificationss();
		}
		if (!$this->collSNotificationss->contains($l)) { // only add it if the **same** object is not already associated
			$this->doAddSNotifications($l);
		}

		return $this;
	}

	/**
	 * @param	SNotifications $sNotifications The sNotifications object to add.
	 */
	protected function doAddSNotifications($sNotifications)
	{
		$this->collSNotificationss[]= $sNotifications;
		$sNotifications->setSProductVariants($this);
	}


	/**
	 * If this collection has already been initialized with
	 * an identical criteria, it returns the collection.
	 * Otherwise if this SProductVariants is new, it will return
	 * an empty collection; or if this SProductVariants has previously
	 * been saved, it will retrieve related SNotificationss from storage.
	 *
	 * This method is protected by default in order to keep the public
	 * api reasonable.  You can provide public methods for those you
	 * actually need in SProductVariants.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @param      string $join_behavior optional join type to use (defaults to Criteria::LEFT_JOIN)
	 * @return     PropelCollection|array SNotifications[] List of SNotifications objects
	 */
	public function getSNotificationssJoinSProducts($criteria = null, $con = null, $join_behavior = Criteria::LEFT_JOIN)
	{
		$query = SNotificationsQuery::create(null, $criteria);
		$query->joinWith('SProducts', $join_behavior);

		return $this->getSNotificationss($query, $con);
	}


	/**
	 * If this collection has already been initialized with
	 * an identical criteria, it returns the collection.
	 * Otherwise if this SProductVariants is new, it will return
	 * an empty collection; or if this SProductVariants has previously
	 * been saved, it will retrieve related SNotificationss from storage.
	 *
	 * This method is protected by default in order to keep the public
	 * api reasonable.  You can provide public methods for those you
	 * actually need in SProductVariants.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @param      string $join_behavior optional join type to use (defaults to Criteria::LEFT_JOIN)
	 * @return     PropelCollection|array SNotifications[] List of SNotifications objects
	 */
	public function getSNotificationssJoinSNotificationStatuses($criteria = null, $con = null, $join_behavior = Criteria::LEFT_JOIN)
	{
		$query = SNotificationsQuery::create(null, $criteria);
		$query->joinWith('SNotificationStatuses', $join_behavior);

		return $this->getSNotificationss($query, $con);
	}

	/**
	 * Clears out the collSOrderProductss collection
	 *
	 * This does not modify the database; however, it will remove any associated objects, causing
	 * them to be refetched by subsequent calls to accessor method.
	 *
	 * @return     void
	 * @see        addSOrderProductss()
	 */
	public function clearSOrderProductss()
	{
		$this->collSOrderProductss = null; // important to set this to NULL since that means it is uninitialized
	}

	/**
	 * Initializes the collSOrderProductss collection.
	 *
	 * By default this just sets the collSOrderProductss collection to an empty array (like clearcollSOrderProductss());
	 * however, you may wish to override this method in your stub class to provide setting appropriate
	 * to your application -- for example, setting the initial array to the values stored in database.
	 *
	 * @param      boolean $overrideExisting If set to true, the method call initializes
	 *                                        the collection even if it is not empty
	 *
	 * @return     void
	 */
	public function initSOrderProductss($overrideExisting = true)
	{
		if (null !== $this->collSOrderProductss && !$overrideExisting) {
			return;
		}
		$this->collSOrderProductss = new PropelObjectCollection();
		$this->collSOrderProductss->setModel('SOrderProducts');
	}

	/**
	 * Gets an array of SOrderProducts objects which contain a foreign key that references this object.
	 *
	 * If the $criteria is not null, it is used to always fetch the results from the database.
	 * Otherwise the results are fetched from the database the first time, then cached.
	 * Next time the same method is called without $criteria, the cached collection is returned.
	 * If this SProductVariants is new, it will return
	 * an empty collection or the current collection; the criteria is ignored on a new object.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @return     PropelCollection|array SOrderProducts[] List of SOrderProducts objects
	 * @throws     PropelException
	 */
	public function getSOrderProductss($criteria = null, PropelPDO $con = null)
	{
		if(null === $this->collSOrderProductss || null !== $criteria) {
			if ($this->isNew() && null === $this->collSOrderProductss) {
				// return empty collection
				$this->initSOrderProductss();
			} else {
				$collSOrderProductss = SOrderProductsQuery::create(null, $criteria)
					->filterBySProductVariants($this)
					->find($con);
				if (null !== $criteria) {
					return $collSOrderProductss;
				}
				$this->collSOrderProductss = $collSOrderProductss;
			}
		}
		return $this->collSOrderProductss;
	}

	/**
	 * Sets a collection of SOrderProducts objects related by a one-to-many relationship
	 * to the current object.
	 * It will also schedule objects for deletion based on a diff between old objects (aka persisted)
	 * and new objects from the given Propel collection.
	 *
	 * @param      PropelCollection $sOrderProductss A Propel collection.
	 * @param      PropelPDO $con Optional connection object
	 */
	public function setSOrderProductss(PropelCollection $sOrderProductss, PropelPDO $con = null)
	{
		$this->sOrderProductssScheduledForDeletion = $this->getSOrderProductss(new Criteria(), $con)->diff($sOrderProductss);

		foreach ($sOrderProductss as $sOrderProducts) {
			// Fix issue with collection modified by reference
			if ($sOrderProducts->isNew()) {
				$sOrderProducts->setSProductVariants($this);
			}
			$this->addSOrderProducts($sOrderProducts);
		}

		$this->collSOrderProductss = $sOrderProductss;
	}

	/**
	 * Returns the number of related SOrderProducts objects.
	 *
	 * @param      Criteria $criteria
	 * @param      boolean $distinct
	 * @param      PropelPDO $con
	 * @return     int Count of related SOrderProducts objects.
	 * @throws     PropelException
	 */
	public function countSOrderProductss(Criteria $criteria = null, $distinct = false, PropelPDO $con = null)
	{
		if(null === $this->collSOrderProductss || null !== $criteria) {
			if ($this->isNew() && null === $this->collSOrderProductss) {
				return 0;
			} else {
				$query = SOrderProductsQuery::create(null, $criteria);
				if($distinct) {
					$query->distinct();
				}
				return $query
					->filterBySProductVariants($this)
					->count($con);
			}
		} else {
			return count($this->collSOrderProductss);
		}
	}

	/**
	 * Method called to associate a SOrderProducts object to this object
	 * through the SOrderProducts foreign key attribute.
	 *
	 * @param      SOrderProducts $l SOrderProducts
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function addSOrderProducts(SOrderProducts $l)
	{
		if ($this->collSOrderProductss === null) {
			$this->initSOrderProductss();
		}
		if (!$this->collSOrderProductss->contains($l)) { // only add it if the **same** object is not already associated
			$this->doAddSOrderProducts($l);
		}

		return $this;
	}

	/**
	 * @param	SOrderProducts $sOrderProducts The sOrderProducts object to add.
	 */
	protected function doAddSOrderProducts($sOrderProducts)
	{
		$this->collSOrderProductss[]= $sOrderProducts;
		$sOrderProducts->setSProductVariants($this);
	}


	/**
	 * If this collection has already been initialized with
	 * an identical criteria, it returns the collection.
	 * Otherwise if this SProductVariants is new, it will return
	 * an empty collection; or if this SProductVariants has previously
	 * been saved, it will retrieve related SOrderProductss from storage.
	 *
	 * This method is protected by default in order to keep the public
	 * api reasonable.  You can provide public methods for those you
	 * actually need in SProductVariants.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @param      string $join_behavior optional join type to use (defaults to Criteria::LEFT_JOIN)
	 * @return     PropelCollection|array SOrderProducts[] List of SOrderProducts objects
	 */
	public function getSOrderProductssJoinSProducts($criteria = null, $con = null, $join_behavior = Criteria::LEFT_JOIN)
	{
		$query = SOrderProductsQuery::create(null, $criteria);
		$query->joinWith('SProducts', $join_behavior);

		return $this->getSOrderProductss($query, $con);
	}


	/**
	 * If this collection has already been initialized with
	 * an identical criteria, it returns the collection.
	 * Otherwise if this SProductVariants is new, it will return
	 * an empty collection; or if this SProductVariants has previously
	 * been saved, it will retrieve related SOrderProductss from storage.
	 *
	 * This method is protected by default in order to keep the public
	 * api reasonable.  You can provide public methods for those you
	 * actually need in SProductVariants.
	 *
	 * @param      Criteria $criteria optional Criteria object to narrow the query
	 * @param      PropelPDO $con optional connection object
	 * @param      string $join_behavior optional join type to use (defaults to Criteria::LEFT_JOIN)
	 * @return     PropelCollection|array SOrderProducts[] List of SOrderProducts objects
	 */
	public function getSOrderProductssJoinSOrders($criteria = null, $con = null, $join_behavior = Criteria::LEFT_JOIN)
	{
		$query = SOrderProductsQuery::create(null, $criteria);
		$query->joinWith('SOrders', $join_behavior);

		return $this->getSOrderProductss($query, $con);
	}

	/**
	 * Clears the current object and sets all attributes to their default values
	 */
	public function clear()
	{
		$this->id = null;
		$this->external_id = null;
		$this->product_id = null;
		$this->price = null;
		$this->number = null;
		$this->stock = null;
		$this->mainimage = null;
		$this->smallimage = null;
		$this->position = null;
		$this->currency = null;
		$this->price_in_main = null;
		$this->alreadyInSave = false;
		$this->alreadyInValidation = false;
		$this->clearAllReferences();
		$this->resetModified();
		$this->setNew(true);
		$this->setDeleted(false);
	}

	/**
	 * Resets all references to other model objects or collections of model objects.
	 *
	 * This method is a user-space workaround for PHP's inability to garbage collect
	 * objects with circular references (even in PHP 5.3). This is currently necessary
	 * when using Propel in certain daemon or large-volumne/high-memory operations.
	 *
	 * @param      boolean $deep Whether to also clear the references on all referrer objects.
	 */
	public function clearAllReferences($deep = false)
	{
		if ($deep) {
			if ($this->collShopKitProducts) {
				foreach ($this->collShopKitProducts as $o) {
					$o->clearAllReferences($deep);
				}
			}
			if ($this->collSProductVariantsI18ns) {
				foreach ($this->collSProductVariantsI18ns as $o) {
					$o->clearAllReferences($deep);
				}
			}
			if ($this->collSNotificationss) {
				foreach ($this->collSNotificationss as $o) {
					$o->clearAllReferences($deep);
				}
			}
			if ($this->collSOrderProductss) {
				foreach ($this->collSOrderProductss as $o) {
					$o->clearAllReferences($deep);
				}
			}
		} // if ($deep)

		// i18n behavior
		$this->currentLocale = 'ru';
		$this->currentTranslations = null;
		if ($this->collShopKitProducts instanceof PropelCollection) {
			$this->collShopKitProducts->clearIterator();
		}
		$this->collShopKitProducts = null;
		if ($this->collSProductVariantsI18ns instanceof PropelCollection) {
			$this->collSProductVariantsI18ns->clearIterator();
		}
		$this->collSProductVariantsI18ns = null;
		if ($this->collSNotificationss instanceof PropelCollection) {
			$this->collSNotificationss->clearIterator();
		}
		$this->collSNotificationss = null;
		if ($this->collSOrderProductss instanceof PropelCollection) {
			$this->collSOrderProductss->clearIterator();
		}
		$this->collSOrderProductss = null;
		$this->aSProducts = null;
		$this->aSCurrencies = null;
	}

	/**
	 * Return the string representation of this object
	 *
	 * @return string
	 */
	public function __toString()
	{
		return (string) $this->exportTo(SProductVariantsPeer::DEFAULT_STRING_FORMAT);
	}

	// i18n behavior
	
	/**
	 * Sets the locale for translations
	 *
	 * @param     string $locale Locale to use for the translation, e.g. 'fr_FR'
	 *
	 * @return    SProductVariants The current object (for fluent API support)
	 */
	public function setLocale($locale = 'ru')
	{
		$this->currentLocale = $locale;
	
		return $this;
	}
	
	/**
	 * Gets the locale for translations
	 *
	 * @return    string $locale Locale to use for the translation, e.g. 'fr_FR'
	 */
	public function getLocale()
	{
		return $this->currentLocale;
	}
	
	/**
	 * Returns the current translation for a given locale
	 *
	 * @param     string $locale Locale to use for the translation, e.g. 'fr_FR'
	 * @param     PropelPDO $con an optional connection object
	 *
	 * @return SProductVariantsI18n */
	public function getTranslation($locale = 'ru', PropelPDO $con = null)
	{
		if (!isset($this->currentTranslations[$locale])) {
			if (null !== $this->collSProductVariantsI18ns) {
				foreach ($this->collSProductVariantsI18ns as $translation) {
					if ($translation->getLocale() == $locale) {
						$this->currentTranslations[$locale] = $translation;
						return $translation;
					}
				}
			}
			if ($this->isNew()) {
				$translation = new SProductVariantsI18n();
				$translation->setLocale($locale);
			} else {
				$translation = SProductVariantsI18nQuery::create()
					->filterByPrimaryKey(array($this->getPrimaryKey(), $locale))
					->findOneOrCreate($con);
				$this->currentTranslations[$locale] = $translation;
			}
			$this->addSProductVariantsI18n($translation);
		}
	
		return $this->currentTranslations[$locale];
	}
	
	/**
	 * Remove the translation for a given locale
	 *
	 * @param     string $locale Locale to use for the translation, e.g. 'fr_FR'
	 * @param     PropelPDO $con an optional connection object
	 *
	 * @return    SProductVariants The current object (for fluent API support)
	 */
	public function removeTranslation($locale = 'ru', PropelPDO $con = null)
	{
		if (!$this->isNew()) {
			SProductVariantsI18nQuery::create()
				->filterByPrimaryKey(array($this->getPrimaryKey(), $locale))
				->delete($con);
		}
		if (isset($this->currentTranslations[$locale])) {
			unset($this->currentTranslations[$locale]);
		}
		foreach ($this->collSProductVariantsI18ns as $key => $translation) {
			if ($translation->getLocale() == $locale) {
				unset($this->collSProductVariantsI18ns[$key]);
				break;
			}
		}
	
		return $this;
	}
	
	/**
	 * Returns the current translation
	 *
	 * @param     PropelPDO $con an optional connection object
	 *
	 * @return SProductVariantsI18n */
	public function getCurrentTranslation(PropelPDO $con = null)
	{
		return $this->getTranslation($this->getLocale(), $con);
	}
	
	
	/**
	 * Get the [name] column value.
	 * 
	 * @return     string
	 */
	public function getName()
	{	return $this->getCurrentTranslation()->getName();
	}
	
	
	/**
	 * Set the value of [name] column.
	 * 
	 * @param      string $v new value
	 * @return     SProductVariants The current object (for fluent API support)
	 */
	public function setName($v)
	{	$this->getCurrentTranslation()->setName($v);
	
		return $this;
	}

} // BaseSProductVariants