package tw.com.iwow.web;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import tw.com.iwow.service.TradeService;

//http://192.168.21.117:8080/iwowwow/iwow/allpay
//String test = "HashKey=5294y06JbISpM5x9&ChoosePayment=Credit&ClientBackURL=http://192.168.21.117:8080/iwowwow/iwow/trade/buy&CreditInstallment=&EncryptType=1&InstallmentAmount=&ItemName=MacBook 30元X2#iPhone6s 40元X1&MerchantID=2000132&MerchantTradeDate="
//+ reportDate2 + "&MerchantTradeNo=DX" + reportDate
//+ "0c16&PaymentType=aio&Redeem=&ReturnURL=http://192.168.21.117:8080/iwowwow/iwow/trade/get&TotalAmount=5&TradeDesc=建立信用卡測試訂單&HashIV=v77hoKGq4kWxNNIS";
@Controller
@RequestMapping(value = "/iwow")
public class AllPayController {
@Autowired 
private TradeService tradeService;
	@RequestMapping(value = "/allpay", method=RequestMethod.GET,produces={"application/json"})
	@ResponseBody
	public String Test1(Map<String,String> model) {
		String[] ItemNames=null;
		String ItemName="";
		DateFormat df = new SimpleDateFormat("MMddyyyyHHmmss");
		DateFormat df2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date today = Calendar.getInstance().getTime();
		String reportDate = df.format(today);
		String reportDate2 = df2.format(today);
		if(ItemNames!=null){
			for(String temp:ItemNames){
				ItemName=ItemName+"#"+temp;
			}
			ItemName=ItemName.substring(1);
		}else{
		ItemName = "黃金會員";
		}
		String tradeDesc = "升級會員";
		String test = "HashKey=5294y06JbISpM5x9&ChoosePayment=Credit&ClientBackURL=http://192.168.21.117:8080/iwowwow/iwow/trade/buy&CreditInstallment=&EncryptType=1&InstallmentAmount=&ItemName="+ItemName+"&MerchantID=2000132&MerchantTradeDate="
				+ reportDate2 + "&MerchantTradeNo=DX" + reportDate
				+ "0c16&PaymentType=aio&Redeem=&ReturnURL=http://192.168.21.117:8080/iwowwow/iwow/trade/get&TotalAmount=100&TradeDesc="+tradeDesc+"&HashIV=v77hoKGq4kWxNNIS";
		String test2 = null;
		System.out.println(test);
		try {
			test2 = URLEncoder.encode(test, "UTF-8").replace("%2d", "-").replace("%5f", "_").replace("%2e", ".")
					.replace("%21", "!").replace("%2a", "*").replace("%28", "(").replace("%29", ")").replace("%20", "+")
					.toLowerCase().toLowerCase();
			System.out.println(test2);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sha256hex = DigestUtils.sha256Hex(test2.toLowerCase());
		System.out.println(sha256hex);

//		model.addObject("ItemName", ItemName);
//		model.addObject("tradeDesc", tradeDesc);
//		model.addObject("reportDate", reportDate);
//		model.addObject("reportDate2", reportDate2);
//		model.addObject("checkMacValue", sha256hex.toUpperCase());
//		return model;
		model.put("ItemName", ItemName);
		model.put("tradeDesc", tradeDesc);
		model.put("reportDate", reportDate);
		model.put("reportDate2", reportDate2);
		model.put("checkMacValue", sha256hex.toUpperCase());
//		return tempValue;
		String[] tempValue2={reportDate.toString(),reportDate2.toString(),sha256hex.toUpperCase().toString()};
		Gson gson=new Gson();
		gson.toJson(tempValue2);
		System.out.println(gson.toJson(tempValue2));
		return gson.toJson(tempValue2);
	}

	@RequestMapping(value = "/trade/buy", method = RequestMethod.GET)
	public String Test3(Model model, String RtnCode, String RtnMsg, String ItemName) {
		if(tradeService.advancedMember()){
			model.addAttribute("success", "success");
			return "redirect:/iwow/index";			
		}
		
		return "/iwow/list";
	}

	@RequestMapping(value = "/trade/get", method = RequestMethod.POST)
	public void Test4(Model model, String RtnCode, String RtnMsg, String ItemName) {
		System.out.println(
				"-----------------------------------------------------------------------------------------------------");
		System.out.println("RtnCode:" + RtnCode + "RtnMsg:" + RtnMsg + "ItemName:" + ItemName);
		// if(!"交易成功".equals(RtnMsg.trim())){
		// model.addAttribute("error", RtnMsg);}
		// if(!"1".equals(RtnCode)){
		// return "/iwow/index";
		// }if("金牌會員".equals(ItemName.trim())){
		// return"controller";
		// }
		// return "/iwow/index";
	}
}
