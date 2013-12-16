package edu.isi.bmkeg.ftd.services
{

	import edu.isi.bmkeg.ftd.model.FTD;
	import edu.isi.bmkeg.ftd.model.FTDRuleSet;
	import edu.isi.bmkeg.ftd.model.qo.FTDRuleSet_qo;
	import edu.isi.bmkeg.ftd.model.qo.FTD_qo;
	import edu.isi.bmkeg.vpdmf.model.ViewTable;
	import edu.isi.bmkeg.vpdmf.model.qo.ViewTable_qo;

	public interface IExtendedFtdService {		

		function runRuleSet(ftd:FTD, ftdRuleSet:FTDRuleSet):void;

	}

}
