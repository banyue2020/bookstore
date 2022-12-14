package com.book.bookshop.web;

import com.book.bookshop.entity.Address;
import com.book.bookshop.entity.User;
import com.book.bookshop.mapper.AddressMapper;
import com.book.bookshop.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @Author:yizhongwei
 * @Date:2/13 21:59
 */
@Controller
@RequestMapping("/address")
public class AddressController {

    private final AddressService addressService;
    private final AddressMapper addressMapper;

    public AddressController(AddressService addressService, AddressMapper addressMapper) {
        this.addressService = addressService;
        this.addressMapper = addressMapper;
    }

    @ResponseBody
    @RequestMapping("/save")
    public String save(Address address, HttpSession session) {
        User user = (User) session.getAttribute("user");
        address.setUserId(user.getId());
        if (address.getIsDefault() != null && address.getIsDefault().equals("on")) {
            addressMapper.setAllTo0(user.getId());
            address.setIsDefault("1");
        }
        if (addressService.save(address)) {
            return "success";
        }
        return "false";
    }

    @RequestMapping("/setDefault")
    @ResponseBody
    public String setDefault(Integer addressId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        addressMapper.setAllTo0(user.getId());
        if (addressMapper.setDefault(addressId) > 0) {
            return "success";
        } else return "fail";
    }

    @RequestMapping("/addressDelete")
    @ResponseBody
    public String addressDelete(Integer addressId) {
        if (addressService.removeById(addressId)) {
            return "success";
        } else return "fail";
    }

}
