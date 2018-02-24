package com.ges.web;
import com.ges.domain.SchoolYear;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/schoolyears")
@Controller
@RooWebScaffold(path = "schoolyears", formBackingObject = SchoolYear.class)
public class SchoolYearController {
}
