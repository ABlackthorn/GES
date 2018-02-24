package com.ges.web;
import com.ges.domain.SchoolMonth;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/schoolmonths")
@Controller
@RooWebScaffold(path = "schoolmonths", formBackingObject = SchoolMonth.class)
public class SchoolMonthController {
}
