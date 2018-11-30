package cn.yfyue.sysauth.db.model;

import java.util.Date;

public class BjInitType {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_TYPE.INIT_TYPE_ID
     *
     * @mbggenerated
     */
    private String initTypeId;
    private String typeState;

    public String getTypeState() {
		return typeState;
	}

	public void setTypeState(String typeState) {
		this.typeState = typeState;
	}

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_TYPE.TYPE_NAME
     *
     * @mbggenerated
     */
    private String typeName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_TYPE.TYPE_CODE
     *
     * @mbggenerated
     */
    private String typeCode;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column BJ_INIT_TYPE.LOG_TIME
     *
     * @mbggenerated
     */
    private Date logTime;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_TYPE.INIT_TYPE_ID
     *
     * @return the value of BJ_INIT_TYPE.INIT_TYPE_ID
     *
     * @mbggenerated
     */
    public String getInitTypeId() {
        return initTypeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_TYPE.INIT_TYPE_ID
     *
     * @param initTypeId the value for BJ_INIT_TYPE.INIT_TYPE_ID
     *
     * @mbggenerated
     */
    public void setInitTypeId(String initTypeId) {
        this.initTypeId = initTypeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_TYPE.TYPE_NAME
     *
     * @return the value of BJ_INIT_TYPE.TYPE_NAME
     *
     * @mbggenerated
     */
    public String getTypeName() {
        return typeName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_TYPE.TYPE_NAME
     *
     * @param typeName the value for BJ_INIT_TYPE.TYPE_NAME
     *
     * @mbggenerated
     */
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_TYPE.TYPE_CODE
     *
     * @return the value of BJ_INIT_TYPE.TYPE_CODE
     *
     * @mbggenerated
     */
    public String getTypeCode() {
        return typeCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_TYPE.TYPE_CODE
     *
     * @param typeCode the value for BJ_INIT_TYPE.TYPE_CODE
     *
     * @mbggenerated
     */
    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode == null ? null : typeCode.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column BJ_INIT_TYPE.LOG_TIME
     *
     * @return the value of BJ_INIT_TYPE.LOG_TIME
     *
     * @mbggenerated
     */
    public Date getLogTime() {
        return logTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column BJ_INIT_TYPE.LOG_TIME
     *
     * @param logTime the value for BJ_INIT_TYPE.LOG_TIME
     *
     * @mbggenerated
     */
    public void setLogTime(Date logTime) {
        this.logTime = logTime;
    }
}