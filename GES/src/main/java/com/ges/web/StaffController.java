package com.ges.web;
import com.ges.domain.Staff;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/staffs")
@Controller
@RooWebScaffold(path = "staffs", formBackingObject = Staff.class)
public class StaffController {
}
