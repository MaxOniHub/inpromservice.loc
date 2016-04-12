<?php

/**
 * Skeleton subclass for representing a row from the 'shop_payment_methods' table.
 *
 * 
 *
 * You should add additional methods to this class to meet the
 * application requirements.  This class will only be generated as
 * long as it does not already exist in the output directory.
 *
 * @package    propel.generator.Shop
 */
class SPaymentMethods extends BaseSPaymentMethods {

	public function attributeLabels()
	{
		return array(
			'Name'=>ShopCore::t(lang('Name','admin')),
			'Description'=>ShopCore::t(lang('Описание','admin')),
			'Active'=>ShopCore::t(lang('Active','admin')),
			'Position'=>ShopCore::t(lang('Position','admin')),
		);
	}

    public function rules()
    {
        return array(
           array(
                 'field'=>'Name',
                 'label'=>$this->getLabel('Name'),
                 'rules'=>'required',
              ),
        );
    }

    /**
     * Get payment form
     *
     * @param SOrders $order
     * @return
     */
    public function getPaymentForm(SOrders $order)
    {
        if (!$this->getPaymentSystemName())
        {
            return null;
        }

        $paymentSystemClass = ShopCore::app()->SPaymentSystems->loadPaymentSystem($this->getPaymentSystemName(), $this);

        if (method_exists($paymentSystemClass,'getForm'))
            return $paymentSystemClass->getForm();
        else
            return null;
    }
	
	/**
	 * Populates the translatable object using an array.
	 *
	 * @param      array  $arr     An array to populate the object from.
	 * @param      string $keyType The type of keys the array uses.
	 * @return     void
	*/
	public function fromArray($arr, $keyType = BasePeer::TYPE_PHPNAME) 
	{
		$peerName = get_class($this).I18nPeer;
		$keys = $peerName::getFieldNames($keyType);

		if (array_key_exists('Locale', $arr)){
			$this->setLocale($arr['Locale']);
			unset($arr['Locale']);
		} else {
            $defaultLanguage = getDefaultLanguage();
            $this->setLocale($defaultLanguage['identif']);
        }

		foreach($keys as $key)
			if (array_key_exists($key, $arr)){
				$methodName = set.$key;
				$this->$methodName($arr[$key]);
			}
		
		parent::fromArray($arr, $keyType);
	}

} // SPaymentMethods
