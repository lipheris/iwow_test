package tw.com.iwow.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import tw.com.iwow.entity.Member;
import tw.com.iwow.service.MemberService;

@RequestMapping(value = "iwow/members")
public class RestMemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(method = RequestMethod.PUT, consumes = { "application/json" }, value = "/{memberId}/following/{painterId}")
	public boolean MemberFollowing(@RequestBody Member member, @PathVariable(value="memberId")Long memberId, @PathVariable(value="painterId")Long painterId) {
		return memberService.follow(memberId, painterId);
	}
}
