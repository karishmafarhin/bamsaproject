package com.bamsa.db.dao;

import java.util.List;

import com.bamsa.db.beans.AssetTicketBean;
import com.bamsa.db.beans.CompanyAccessoryBean;
import com.bamsa.db.beans.CompanyAssetsBean;
import com.bamsa.db.beans.CompanyConsumableBean;
import com.bamsa.db.beans.CompanyLicensesBean;
import com.bamsa.db.beans.NewBranchBean;
import com.bamsa.db.exceptions.DBUpdateException;
import com.bamsa.db.beans.CompanyComponentBean;


public interface AssetsDAO {
	/**
	 * creates asset
	 * @param CompanyAssetsBean bean
	 * @return CompanyAssetsBean bean
	 */
	public CompanyAssetsBean createAsset(CompanyAssetsBean bean);
	/**
	 * creates license
	 * @param CompanyLicensesBean bean
	 * @return CompanyLicensesBean bean
	 */
	public CompanyLicensesBean createLicense(CompanyLicensesBean bean);
	/**
	 * creates consumable
	 * @param CompanyConsumableBean bean
	 * @return CompanyConsumablebean bean
	 */
	public CompanyConsumableBean createConsumable(CompanyConsumableBean bean);
	/**
	 * creates Accessory
	 * @param CompanyAccessoryBean bean
	 * @return CompanyAccessoryBean bean
	 */
    public CompanyAccessoryBean createAccessory(CompanyAccessoryBean bean);
    /**
	 * creates Component
	 * @param CompanyComponentBean bean
	 * @return CompanyComponentBean bean
	 */
    public CompanyComponentBean createComponent(CompanyComponentBean bean);
    /**
     * retrieve asset
     * @param CompanyAssetBean bean
     */
   public List<CompanyAssetsBean> getCompanyAsset();
   public List<CompanyLicensesBean>  getCompanyLicensesDetails();
   public List<CompanyConsumableBean>  getCompanyConsumableDetails();
   public List<CompanyAccessoryBean> getCompanyAccessory();
   public List<CompanyComponentBean> getCompanyComponent();
   public AssetTicketBean createAssetTicket(AssetTicketBean bean);
   public List<AssetTicketBean> getAssetTicket();
   public AssetTicketBean updateBstatusOfAssetTicket(AssetTicketBean bean) throws DBUpdateException;
   public AssetTicketBean updateRstatusOfAssetTicket(AssetTicketBean bean) throws DBUpdateException;
   public AssetTicketBean updateAssetStatus(AssetTicketBean bean)throws DBUpdateException;
   public NewBranchBean saveBranchDetails(NewBranchBean branch);
   public List<String> getBranchNameDetails();
}
