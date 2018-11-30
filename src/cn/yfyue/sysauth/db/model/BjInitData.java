package cn.yfyue.sysauth.db.model;

import java.util.Date;

public class BjInitData {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_DATA.INIT_DATA_ID
     *
     * @mbggenerated
     */
    private String initDataId;
    private String typeName;
    private String dataState;
    private String extendField;
    public String getExtendField() {
		return extendField;
	}

	public void setExtendField(String extendField) {
		this.extendField = extendField;
	}

	public String getDataState() {
		return dataState;
	}

	public void setDataState(String dataState) {
		this.dataState = dataState;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_DATA.DATA_CODE
     *
     * @mbggenerated
     */
    private String dataCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_DATA.DATA_NAME
     *
     * @mbggenerated
     */
    private String dataName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_DATA.TYPE_CODE
     *
     * @mbggenerated
     */
    private String typeCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_DATA.LOG_TIME
     *
     * @mbggenerated
     */
    private Date logTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_DATA.INIT_DATA_ID
     *
     * @return the value of BJ_INIT_DATA.INIT_DATA_ID
     *
     * @mbggenerated
     */
    public String getInitDataId() {
        return initDataId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_DATA.INIT_DATA_ID
     *
     * @param initDataId the value for BJ_INIT_DATA.INIT_DATA_ID
     *
     * @mbggenerated
     */
    public void setInitDataId(String initDataId) {
        this.initDataId = initDataId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_DATA.DATA_CODE
     *
     * @return the value of BJ_INIT_DATA.DATA_CODE
     *
     * @mbggenerated
     */
    public String getDataCode() {
        return dataCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_DATA.DATA_CODE
     *
     * @param dataCode the value for BJ_INIT_DATA.DATA_CODE
     *
     * @mbggenerated
     */
    public void setDataCode(String dataCode) {
        this.dataCode = dataCode == null ? null : dataCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_DATA.DATA_NAME
     *
     * @return the value of BJ_INIT_DATA.DATA_NAME
     *
     * @mbggenerated
     */
    public String getDataName() {
        return dataName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_DATA.DATA_NAME
     *
     * @param dataName the value for BJ_INIT_DATA.DATA_NAME
     *
     * @mbggenerated
     */
    public void setDataName(String dataName) {
        this.dataName = dataName == null ? null : dataName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_DATA.TYPE_CODE
     *
     * @return the value of BJ_INIT_DATA.TYPE_CODE
     *
     * @mbggenerated
     */
    public String getTypeCode() {
        return typeCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_DATA.TYPE_CODE
     *
     * @param typeCode the value for BJ_INIT_DATA.TYPE_CODE
     *
     * @mbggenerated
     */
    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_DATA.LOG_TIME
     *
     * @return the value of BJ_INIT_DATA.LOG_TIME
     *
     * @mbggenerated
     */
    public Date getLogTime() {
        return logTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_DATA.LOG_TIME
     *
     * @param logTime the value for BJ_INIT_DATA.LOG_TIME
     *
     * @mbggenerated
     */
    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }
}