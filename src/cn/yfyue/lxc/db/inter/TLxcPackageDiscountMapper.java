package cn.yfyue.lxc.db.inter;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.yfyue.lxc.db.model.TLxcPackageDiscount;

public interface TLxcPackageDiscountMapper {
	//查询全部套餐
	List<TLxcPackageDiscount> getDiscountList(@Param("qkey") String qkey, @Param("startRow") int startRow,
				@Param("rownum") int rownum);
	List<TLxcPackageDiscount> getDiscountListUnremove(@Param("qkey") String qkey, @Param("startRow") int startRow,
			@Param("rownum") int rownum);
	// 统计多少条套餐
	int getDiscountListCount(@Param("qkey") String qkey);
	//根据id删除优惠套餐  (有外键，暂时不写)
	int delDiscountById(String menid);
	//更新套餐数据
	int upDiscountDate(TLxcPackageDiscount lxcPackageDiscount);
	//取自己的套餐数据
	TLxcPackageDiscount getMyDiscount(@Param("id")String id);
	//添加套餐
	int addDiscount(TLxcPackageDiscount tLxcPackageDiscount);
	//禁用套餐
	int discountmanage(String id);
	//启用套餐
	int startDisount(String id);
}