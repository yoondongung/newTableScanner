package com.noshow.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.noshow.service.ReservationService;
import com.noshow.vo.Member;
import com.noshow.vo.OrderTable;
import com.noshow.vo.Reservation;
import com.noshow.vo.Restaurant;
import com.noshow.vo.Table;


@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping("/addReservation")
	@Transactional
	public ModelAndView addReservation(String resDate, int resPeople, String resStartTime, String resPayStatement, String businessId, @RequestParam List<Integer> tableList) {
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		
		// 현재 사용자 정보를 받아와서 member 객체 생성
		Member member = (Member)authentication.getPrincipal();
		
		String memberId = member.getMemberId();
		
		//test
		for(int i : tableList) {
			System.out.println("tableNum : "+i);
		}
		Reservation reservation = service.addReservation(resDate, resPeople, resStartTime, resPayStatement, memberId, businessId, tableList);
		
		if (reservation != null) {
			System.out.println("addReservation Controller - 예약 성공!");
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/reservationSuccess.do");
			mav.addObject("reservation", reservation);
			mav.addObject("tableList", tableList);
			return mav;
		} else {
			System.out.println("addReservation Controller - 예약 실패ㅠㅠ");
			return new ModelAndView("index.tiles");
		}
	} 
	
	
	@RequestMapping("/reservationSuccess")
	public ModelAndView reservationSuccess(HttpServletRequest request) {
		Reservation reservation = (Reservation)request.getAttribute("reservation");
		String businessId = reservation.getBusinessId();
		System.out.println("reservationSuccess - businessId : " + businessId);	// log
		String restaurantName = service.selectRestaurantByBusinessId(businessId).getRtName();
		System.out.println("reservationSuccess - restaurantName : " + restaurantName); //log
		
		List<OrderTable> orderTableList = service.selectOrderTableByResNum(reservation.getResNum());
		// 검증
		for(OrderTable table : orderTableList) {
			System.out.println("reservationSuccessController- table: " + table);//log
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("reservation/reservation_success.tiles");
		mav.addObject("reservation", reservation);
		mav.addObject("restaurantName", restaurantName);
		mav.addObject("orderTableList", orderTableList);

		return mav;
	}
	
	@RequestMapping("/tableSearchController")
	public ModelAndView tableSearchController(HttpServletRequest request, String resDate, String resTime, int resPeople,String businessId) {
		
		Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");
		
		List<Table> tableList = service.selectUsableTable(resDate, resTime, businessId);
		for(Table t : tableList) {
			System.out.println("ReservationController.tableSearchCtr - "+t);
		}
		
		List<Table> allTable = (List<Table>) request.getAttribute("allTable");
		for(Table tables : allTable) {
			System.out.println("ReservationController.tableSearchCtr - " + tables);
		}
		//log	
		System.out.println("tableSearchController - "+resDate);
		System.out.println("tableSearchController - " + businessId);
		System.out.println("tableSearchController - restaurant " + restaurant);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/finalResInfo.do");
		mav.addObject("resDate", resDate);
		mav.addObject("resTime", resTime);
		mav.addObject("resPeople", resPeople);
		mav.addObject("allTable",allTable);
		mav.addObject("tableList", tableList);
		mav.addObject("restaurant", restaurant);
		
		return mav;
	}
	
	/* 2017.12.05 23:18-현준_ajax TEST Controller */
	@RequestMapping("/reSearchTable")
	@ResponseBody
	public List<Table> reSearchTable(String resDate, String resStartTIme, String businessId , HttpServletResponse response) throws IOException {
//		int resPeople = (Integer)params.get("resPeople");
		System.out.println("ReservationController.reSearchTable - resDate : " + resDate);
		System.out.println("ReservationController.reSearchTable - resStartTime : " + resDate);
		
		List<Table> tableList = service.selectUsableTable(resDate, resStartTIme, businessId);
		
		return tableList;
	}
	
	
	/* 내 예약 조회 */
	@RequestMapping("/myReservation")
	public ModelAndView myReservation() {
		
		// 현재 사용자 정보를 받아와서 member 객체 생성
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		Member member = (Member)authentication.getPrincipal();
		
		String memberId = member.getMemberId();
		List<Reservation> reservationList = service.selectJoinReservationByMemId(memberId);
	
		return new ModelAndView("member/mypage_reservation.tiles", "reservationList", reservationList);
		
	}
	
	/* 결제 */
	@RequestMapping("/payment")
	public ModelAndView payment(String resDate, int resPeople, String resStartTime, String resPayStatement, String businessId, @RequestParam List<Integer> tableList) {
		System.out.println("payment호출");
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication authentication = context.getAuthentication();
		System.out.println("payment - resDate : "+resDate);
		for(int t : tableList) {
			System.out.println("payment-table : " + t);
		}
		// 현재 사용자 정보를 받아와서 member 객체 생성
		Member member = (Member)authentication.getPrincipal();
		String memberId = member.getMemberId();
		int resPrice = service.calTotalPrice(businessId, resPeople);
		Reservation reservation = new Reservation(resDate, resPeople, resStartTime, resPrice, resPayStatement ,memberId, businessId, tableList);
	
		ModelAndView mav = new ModelAndView();
		mav.addObject("member", member);
		mav.addObject("reservation", reservation);
		mav.setViewName("reservation/payment.tiles");
		return mav; 
	}
	
}
