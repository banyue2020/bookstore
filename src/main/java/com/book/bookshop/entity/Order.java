package com.book.bookshop.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.util.Date;
import java.util.List;


@Data
@TableName("bs_order")
public class Order {
    @TableId(type = IdType.AUTO)
    private Integer id;
    private String orderNum;
    private Date createDate;
    private Integer userId;
    private Integer addressId;
    private String orderStatus;
    private Integer expressId;
    //用户信息
    @TableField(exist = false)
    private User user;

    //地址信息
    @TableField(exist = false)
    private Address address;

    //订单明细
    @TableField(exist = false)
    private List<OrderItem> orderItems;

    //订单总金额
    @TableField(exist = false)
    private double totalPrice;

    //物流信息
    @TableField(exist = false)
    private Express express;
}
