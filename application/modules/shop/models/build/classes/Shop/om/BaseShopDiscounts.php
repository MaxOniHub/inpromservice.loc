<?php


/**
 * Base class that represents a row from the 'shop_discounts' table.
 *
 * 
 *
 * @package    propel.generator.Shop.om
 */
abstract class BaseShopDiscounts extends ShopBaseObject  implements Persistent
{

	/**
	 * Peer class name
	 */
	const PEER = 'ShopDiscountsPeer';

	/**
	 * The Peer class.
	 * Instance provides a convenient way of calling static methods on a class
	 * that calling code may not be able to identify.
	 * @var        ShopDiscountsPeer
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
	 * The value for the name field.
	 * @var        string
	 */
	protected $name;

	/**
	 * The value for the description field.
	 * @var        string
	 */
	protected $description;

	/**
	 * The value for the active field.
	 * @var        boolean
	 */
	protected $active;

	/**
	 * The value for the date_start field.
	 * @var        int
	 */
	protected $date_start;

	/**
	 * The value for the date_stop field.
	 * @var        int
	 */
	protected $date_stop;

	/**
	 * The value for the discount field.
	 * @var        string
	 */
	protected $discount;

	/**
	 * The value for the user_group field.
	 * @var        string
	 */
	protected $user_group;

	/**
	 * The value for the min_price field.
	 * @var        string
	 */
	protected $min_price;

	/**
	 * The value for the max_price field.
	 * @var        string
	 */
	protected $max_price;

	/**
	 * The value for the categories field.
	 * @var        string
	 */
	protected $categories;

	/**
	 * The value for the products field.
	 * @var        string
	 */
	protected $products;

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
	 * Get the [name] column value.
	 * 
	 * @return     string
	 */
	public function getName()
	{
		return $this->name;
	}

	/**
	 * Get the [description] column value.
	 * 
	 * @return     string
	 */
	public function getDescription()
	{
		return $this->description;
	}

	/**
	 * Get the [active] column value.
	 * 
	 * @return     boolean
	 */
	public function getActive()
	{
		return $this->active;
	}

	/**
	 * Get the [date_start] column value.
	 * 
	 * @return     int
	 */
	public function getDateStart()
	{
		return $this->date_start;
	}

	/**
	 * Get the [date_stop] column value.
	 * 
	 * @return     int
	 */
	public function getDateStop()
	{
		return $this->date_stop;
	}

	/**
	 * Get the [discount] column value.
	 * 
	 * @return     string
	 */
	public function getDiscount()
	{
		return $this->discount;
	}

	/**
	 * Get the [user_group] column value.
	 * 
	 * @return     string
	 */
	public function getUserGroup()
	{
		return $this->user_group;
	}

	/**
	 * Get the [min_price] column value.
	 * 
	 * @return     string
	 */
	public function getMinPrice()
	{
		return $this->min_price;
	}

	/**
	 * Get the [max_price] column value.
	 * 
	 * @return     string
	 */
	public function getMaxPrice()
	{
		return $this->max_price;
	}

	/**
	 * Get the [categories] column value.
	 * 
	 * @return     string
	 */
	public function getCategories()
	{
		return $this->categories;
	}

	/**
	 * Get the [products] column value.
	 * 
	 * @return     string
	 */
	public function getProducts()
	{
		return $this->products;
	}

	/**
	 * Set the value of [id] column.
	 * 
	 * @param      int $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setId($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->id !== $v) {
			$this->id = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::ID;
		}

		return $this;
	} // setId()

	/**
	 * Set the value of [name] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setName($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->name !== $v) {
			$this->name = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::NAME;
		}

		return $this;
	} // setName()

	/**
	 * Set the value of [description] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setDescription($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->description !== $v) {
			$this->description = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::DESCRIPTION;
		}

		return $this;
	} // setDescription()

	/**
	 * Sets the value of the [active] column.
	 * Non-boolean arguments are converted using the following rules:
	 *   * 1, '1', 'true',  'on',  and 'yes' are converted to boolean true
	 *   * 0, '0', 'false', 'off', and 'no'  are converted to boolean false
	 * Check on string values is case insensitive (so 'FaLsE' is seen as 'false').
	 * 
	 * @param      boolean|integer|string $v The new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setActive($v)
	{
		if ($v !== null) {
			if (is_string($v)) {
				$v = in_array(strtolower($v), array('false', 'off', '-', 'no', 'n', '0', '')) ? false : true;
			} else {
				$v = (boolean) $v;
			}
		}

		if ($this->active !== $v) {
			$this->active = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::ACTIVE;
		}

		return $this;
	} // setActive()

	/**
	 * Set the value of [date_start] column.
	 * 
	 * @param      int $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setDateStart($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->date_start !== $v) {
			$this->date_start = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::DATE_START;
		}

		return $this;
	} // setDateStart()

	/**
	 * Set the value of [date_stop] column.
	 * 
	 * @param      int $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setDateStop($v)
	{
		if ($v !== null) {
			$v = (int) $v;
		}

		if ($this->date_stop !== $v) {
			$this->date_stop = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::DATE_STOP;
		}

		return $this;
	} // setDateStop()

	/**
	 * Set the value of [discount] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setDiscount($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->discount !== $v) {
			$this->discount = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::DISCOUNT;
		}

		return $this;
	} // setDiscount()

	/**
	 * Set the value of [user_group] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setUserGroup($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->user_group !== $v) {
			$this->user_group = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::USER_GROUP;
		}

		return $this;
	} // setUserGroup()

	/**
	 * Set the value of [min_price] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setMinPrice($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->min_price !== $v) {
			$this->min_price = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::MIN_PRICE;
		}

		return $this;
	} // setMinPrice()

	/**
	 * Set the value of [max_price] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setMaxPrice($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->max_price !== $v) {
			$this->max_price = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::MAX_PRICE;
		}

		return $this;
	} // setMaxPrice()

	/**
	 * Set the value of [categories] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setCategories($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->categories !== $v) {
			$this->categories = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::CATEGORIES;
		}

		return $this;
	} // setCategories()

	/**
	 * Set the value of [products] column.
	 * 
	 * @param      string $v new value
	 * @return     ShopDiscounts The current object (for fluent API support)
	 */
	public function setProducts($v)
	{
		if ($v !== null) {
			$v = (string) $v;
		}

		if ($this->products !== $v) {
			$this->products = $v;
			$this->modifiedColumns[] = ShopDiscountsPeer::PRODUCTS;
		}

		return $this;
	} // setProducts()

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
			$this->name = ($row[$startcol + 1] !== null) ? (string) $row[$startcol + 1] : null;
			$this->description = ($row[$startcol + 2] !== null) ? (string) $row[$startcol + 2] : null;
			$this->active = ($row[$startcol + 3] !== null) ? (boolean) $row[$startcol + 3] : null;
			$this->date_start = ($row[$startcol + 4] !== null) ? (int) $row[$startcol + 4] : null;
			$this->date_stop = ($row[$startcol + 5] !== null) ? (int) $row[$startcol + 5] : null;
			$this->discount = ($row[$startcol + 6] !== null) ? (string) $row[$startcol + 6] : null;
			$this->user_group = ($row[$startcol + 7] !== null) ? (string) $row[$startcol + 7] : null;
			$this->min_price = ($row[$startcol + 8] !== null) ? (string) $row[$startcol + 8] : null;
			$this->max_price = ($row[$startcol + 9] !== null) ? (string) $row[$startcol + 9] : null;
			$this->categories = ($row[$startcol + 10] !== null) ? (string) $row[$startcol + 10] : null;
			$this->products = ($row[$startcol + 11] !== null) ? (string) $row[$startcol + 11] : null;
			$this->resetModified();

			$this->setNew(false);

			if ($rehydrate) {
				$this->ensureConsistency();
			}

			return $startcol + 12; // 12 = ShopDiscountsPeer::NUM_HYDRATE_COLUMNS.

		} catch (Exception $e) {
			throw new PropelException("Error populating ShopDiscounts object", $e);
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
			$con = Propel::getConnection(ShopDiscountsPeer::DATABASE_NAME, Propel::CONNECTION_READ);
		}

		// We don't need to alter the object instance pool; we're just modifying this instance
		// already in the pool.

		$stmt = ShopDiscountsPeer::doSelectStmt($this->buildPkeyCriteria(), $con);
		$row = $stmt->fetch(PDO::FETCH_NUM);
		$stmt->closeCursor();
		if (!$row) {
			throw new PropelException('Cannot find matching row in the database to reload object values.');
		}
		$this->hydrate($row, 0, true); // rehydrate

		if ($deep) {  // also de-associate any related objects?

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
			$con = Propel::getConnection(ShopDiscountsPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
		}

		$con->beginTransaction();
		try {
			$deleteQuery = ShopDiscountsQuery::create()
				->filterByPrimaryKey($this->getPrimaryKey());
			$ret = $this->preDelete($con);
			if ($ret) {
				$deleteQuery->delete($con);
				$this->postDelete($con);
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
			$con = Propel::getConnection(ShopDiscountsPeer::DATABASE_NAME, Propel::CONNECTION_WRITE);
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
				ShopDiscountsPeer::addInstanceToPool($this);
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

		$this->modifiedColumns[] = ShopDiscountsPeer::ID;
		if (null !== $this->id) {
			throw new PropelException('Cannot insert a value for auto-increment primary key (' . ShopDiscountsPeer::ID . ')');
		}

		 // check the columns in natural order for more readable SQL queries
		if ($this->isColumnModified(ShopDiscountsPeer::ID)) {
			$modifiedColumns[':p' . $index++]  = '`ID`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::NAME)) {
			$modifiedColumns[':p' . $index++]  = '`NAME`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::DESCRIPTION)) {
			$modifiedColumns[':p' . $index++]  = '`DESCRIPTION`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::ACTIVE)) {
			$modifiedColumns[':p' . $index++]  = '`ACTIVE`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::DATE_START)) {
			$modifiedColumns[':p' . $index++]  = '`DATE_START`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::DATE_STOP)) {
			$modifiedColumns[':p' . $index++]  = '`DATE_STOP`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::DISCOUNT)) {
			$modifiedColumns[':p' . $index++]  = '`DISCOUNT`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::USER_GROUP)) {
			$modifiedColumns[':p' . $index++]  = '`USER_GROUP`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::MIN_PRICE)) {
			$modifiedColumns[':p' . $index++]  = '`MIN_PRICE`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::MAX_PRICE)) {
			$modifiedColumns[':p' . $index++]  = '`MAX_PRICE`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::CATEGORIES)) {
			$modifiedColumns[':p' . $index++]  = '`CATEGORIES`';
		}
		if ($this->isColumnModified(ShopDiscountsPeer::PRODUCTS)) {
			$modifiedColumns[':p' . $index++]  = '`PRODUCTS`';
		}

		$sql = sprintf(
			'INSERT INTO `shop_discounts` (%s) VALUES (%s)',
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
					case '`NAME`':						
						$stmt->bindValue($identifier, $this->name, PDO::PARAM_STR);
						break;
					case '`DESCRIPTION`':						
						$stmt->bindValue($identifier, $this->description, PDO::PARAM_STR);
						break;
					case '`ACTIVE`':
						$stmt->bindValue($identifier, (int) $this->active, PDO::PARAM_INT);
						break;
					case '`DATE_START`':						
						$stmt->bindValue($identifier, $this->date_start, PDO::PARAM_INT);
						break;
					case '`DATE_STOP`':						
						$stmt->bindValue($identifier, $this->date_stop, PDO::PARAM_INT);
						break;
					case '`DISCOUNT`':						
						$stmt->bindValue($identifier, $this->discount, PDO::PARAM_STR);
						break;
					case '`USER_GROUP`':						
						$stmt->bindValue($identifier, $this->user_group, PDO::PARAM_STR);
						break;
					case '`MIN_PRICE`':						
						$stmt->bindValue($identifier, $this->min_price, PDO::PARAM_STR);
						break;
					case '`MAX_PRICE`':						
						$stmt->bindValue($identifier, $this->max_price, PDO::PARAM_STR);
						break;
					case '`CATEGORIES`':						
						$stmt->bindValue($identifier, $this->categories, PDO::PARAM_STR);
						break;
					case '`PRODUCTS`':						
						$stmt->bindValue($identifier, $this->products, PDO::PARAM_STR);
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


			if (($retval = ShopDiscountsPeer::doValidate($this, $columns)) !== true) {
				$failureMap = array_merge($failureMap, $retval);
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
		$pos = ShopDiscountsPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
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
				return $this->getName();
				break;
			case 2:
				return $this->getDescription();
				break;
			case 3:
				return $this->getActive();
				break;
			case 4:
				return $this->getDateStart();
				break;
			case 5:
				return $this->getDateStop();
				break;
			case 6:
				return $this->getDiscount();
				break;
			case 7:
				return $this->getUserGroup();
				break;
			case 8:
				return $this->getMinPrice();
				break;
			case 9:
				return $this->getMaxPrice();
				break;
			case 10:
				return $this->getCategories();
				break;
			case 11:
				return $this->getProducts();
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
	 *
	 * @return    array an associative array containing the field names (as keys) and field values
	 */
	public function toArray($keyType = BasePeer::TYPE_PHPNAME, $includeLazyLoadColumns = true, $alreadyDumpedObjects = array())
	{
		if (isset($alreadyDumpedObjects['ShopDiscounts'][$this->getPrimaryKey()])) {
			return '*RECURSION*';
		}
		$alreadyDumpedObjects['ShopDiscounts'][$this->getPrimaryKey()] = true;
		$keys = ShopDiscountsPeer::getFieldNames($keyType);
		$result = array(
			$keys[0] => $this->getId(),
			$keys[1] => $this->getName(),
			$keys[2] => $this->getDescription(),
			$keys[3] => $this->getActive(),
			$keys[4] => $this->getDateStart(),
			$keys[5] => $this->getDateStop(),
			$keys[6] => $this->getDiscount(),
			$keys[7] => $this->getUserGroup(),
			$keys[8] => $this->getMinPrice(),
			$keys[9] => $this->getMaxPrice(),
			$keys[10] => $this->getCategories(),
			$keys[11] => $this->getProducts(),
		);
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
		$pos = ShopDiscountsPeer::translateFieldName($name, $type, BasePeer::TYPE_NUM);
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
				$this->setName($value);
				break;
			case 2:
				$this->setDescription($value);
				break;
			case 3:
				$this->setActive($value);
				break;
			case 4:
				$this->setDateStart($value);
				break;
			case 5:
				$this->setDateStop($value);
				break;
			case 6:
				$this->setDiscount($value);
				break;
			case 7:
				$this->setUserGroup($value);
				break;
			case 8:
				$this->setMinPrice($value);
				break;
			case 9:
				$this->setMaxPrice($value);
				break;
			case 10:
				$this->setCategories($value);
				break;
			case 11:
				$this->setProducts($value);
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
		$keys = ShopDiscountsPeer::getFieldNames($keyType);

		if (array_key_exists($keys[0], $arr)) $this->setId($arr[$keys[0]]);
		if (array_key_exists($keys[1], $arr)) $this->setName($arr[$keys[1]]);
		if (array_key_exists($keys[2], $arr)) $this->setDescription($arr[$keys[2]]);
		if (array_key_exists($keys[3], $arr)) $this->setActive($arr[$keys[3]]);
		if (array_key_exists($keys[4], $arr)) $this->setDateStart($arr[$keys[4]]);
		if (array_key_exists($keys[5], $arr)) $this->setDateStop($arr[$keys[5]]);
		if (array_key_exists($keys[6], $arr)) $this->setDiscount($arr[$keys[6]]);
		if (array_key_exists($keys[7], $arr)) $this->setUserGroup($arr[$keys[7]]);
		if (array_key_exists($keys[8], $arr)) $this->setMinPrice($arr[$keys[8]]);
		if (array_key_exists($keys[9], $arr)) $this->setMaxPrice($arr[$keys[9]]);
		if (array_key_exists($keys[10], $arr)) $this->setCategories($arr[$keys[10]]);
		if (array_key_exists($keys[11], $arr)) $this->setProducts($arr[$keys[11]]);
	}

	/**
	 * Build a Criteria object containing the values of all modified columns in this object.
	 *
	 * @return     Criteria The Criteria object containing all modified values.
	 */
	public function buildCriteria()
	{
		$criteria = new Criteria(ShopDiscountsPeer::DATABASE_NAME);

		if ($this->isColumnModified(ShopDiscountsPeer::ID)) $criteria->add(ShopDiscountsPeer::ID, $this->id);
		if ($this->isColumnModified(ShopDiscountsPeer::NAME)) $criteria->add(ShopDiscountsPeer::NAME, $this->name);
		if ($this->isColumnModified(ShopDiscountsPeer::DESCRIPTION)) $criteria->add(ShopDiscountsPeer::DESCRIPTION, $this->description);
		if ($this->isColumnModified(ShopDiscountsPeer::ACTIVE)) $criteria->add(ShopDiscountsPeer::ACTIVE, $this->active);
		if ($this->isColumnModified(ShopDiscountsPeer::DATE_START)) $criteria->add(ShopDiscountsPeer::DATE_START, $this->date_start);
		if ($this->isColumnModified(ShopDiscountsPeer::DATE_STOP)) $criteria->add(ShopDiscountsPeer::DATE_STOP, $this->date_stop);
		if ($this->isColumnModified(ShopDiscountsPeer::DISCOUNT)) $criteria->add(ShopDiscountsPeer::DISCOUNT, $this->discount);
		if ($this->isColumnModified(ShopDiscountsPeer::USER_GROUP)) $criteria->add(ShopDiscountsPeer::USER_GROUP, $this->user_group);
		if ($this->isColumnModified(ShopDiscountsPeer::MIN_PRICE)) $criteria->add(ShopDiscountsPeer::MIN_PRICE, $this->min_price);
		if ($this->isColumnModified(ShopDiscountsPeer::MAX_PRICE)) $criteria->add(ShopDiscountsPeer::MAX_PRICE, $this->max_price);
		if ($this->isColumnModified(ShopDiscountsPeer::CATEGORIES)) $criteria->add(ShopDiscountsPeer::CATEGORIES, $this->categories);
		if ($this->isColumnModified(ShopDiscountsPeer::PRODUCTS)) $criteria->add(ShopDiscountsPeer::PRODUCTS, $this->products);

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
		$criteria = new Criteria(ShopDiscountsPeer::DATABASE_NAME);
		$criteria->add(ShopDiscountsPeer::ID, $this->id);

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
	 * @param      object $copyObj An object of ShopDiscounts (or compatible) type.
	 * @param      boolean $deepCopy Whether to also copy all rows that refer (by fkey) to the current row.
	 * @param      boolean $makeNew Whether to reset autoincrement PKs and make the object new.
	 * @throws     PropelException
	 */
	public function copyInto($copyObj, $deepCopy = false, $makeNew = true)
	{
		$copyObj->setName($this->getName());
		$copyObj->setDescription($this->getDescription());
		$copyObj->setActive($this->getActive());
		$copyObj->setDateStart($this->getDateStart());
		$copyObj->setDateStop($this->getDateStop());
		$copyObj->setDiscount($this->getDiscount());
		$copyObj->setUserGroup($this->getUserGroup());
		$copyObj->setMinPrice($this->getMinPrice());
		$copyObj->setMaxPrice($this->getMaxPrice());
		$copyObj->setCategories($this->getCategories());
		$copyObj->setProducts($this->getProducts());
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
	 * @return     ShopDiscounts Clone of current object.
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
	 * @return     ShopDiscountsPeer
	 */
	public function getPeer()
	{
		if (self::$peer === null) {
			self::$peer = new ShopDiscountsPeer();
		}
		return self::$peer;
	}

	/**
	 * Clears the current object and sets all attributes to their default values
	 */
	public function clear()
	{
		$this->id = null;
		$this->name = null;
		$this->description = null;
		$this->active = null;
		$this->date_start = null;
		$this->date_stop = null;
		$this->discount = null;
		$this->user_group = null;
		$this->min_price = null;
		$this->max_price = null;
		$this->categories = null;
		$this->products = null;
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
		} // if ($deep)

	}

	/**
	 * Return the string representation of this object
	 *
	 * @return string
	 */
	public function __toString()
	{
		return (string) $this->exportTo(ShopDiscountsPeer::DEFAULT_STRING_FORMAT);
	}

} // BaseShopDiscounts
