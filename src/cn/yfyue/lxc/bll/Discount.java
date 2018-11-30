package cn.yfyue.lxc.bll;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.yfyue.lxc.db.inter.TLxcPackageDiscountMapper;
import cn.yfyue.lxc.db.model.TLxcPackageDiscount;

@Service
public class Discount {
	@Autowired
	private TLxcPackageDiscountMapper lxcPackageDiscountMapper;

	// 查询全部套餐
	public List<TLxcPackageDiscount> getDiscountList(@Param("qkey") String qkey, @Param("startRow") int startRow,
			@Param("rownum") int rownum) {
		return lxcPackageDiscountMapper.getDiscountList(qkey, startRow, rownum);
	}

	// 统计多少条套餐
	public int getDiscountListCount(@Param("qkey") String qkey) {
		return lxcPackageDiscountMapper.getDiscountListCount(qkey);
	}

	// 根据id删除优惠套餐(有外键，暂时不写)
	public int delDiscountById(String menid) {
		return lxcPackageDiscountMapper.delDiscountById(menid);
	}

	// 更新套餐数据
	public int upDiscountDate(TLxcPackageDiscount lxcPackageDiscount) {
		return lxcPackageDiscountMapper.upDiscountDate(lxcPackageDiscount);
	}

	// 取自己的套餐数据
	public TLxcPackageDiscount getMyDiscount(@Param("id") String id) {
		return lxcPackageDiscountMapper.getMyDiscount(id);
	}

	// 添加套餐
	public int addDiscount(TLxcPackageDiscount tLxcPackageDiscount) {
		return lxcPackageDiscountMapper.addDiscount(tLxcPackageDiscount);
	}
	//禁用套餐
	public int disCountmanage(String id){
		return lxcPackageDiscountMapper.discountmanage(id);
	}
	//启用套餐
	public int startDisount(String id){
		return lxcPackageDiscountMapper.startDisount(id);
	}
	
	
}
