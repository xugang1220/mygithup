package cn.yfyue.sysauth.wrap;

import java.util.List;
import cn.yfyue.sysauth.db.model.BjArea;

public class AreaWarp extends BjArea{
	private List<AreaWarp> children;

	public List<AreaWarp> getChildren() {
		return children;
	}

	public void setChildren(List<AreaWarp> children) {
		this.children = children;
	}
}
