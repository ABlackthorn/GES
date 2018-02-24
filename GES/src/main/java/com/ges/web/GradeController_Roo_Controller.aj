// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ges.web;

import com.ges.domain.Grade;
import com.ges.domain.Subject;
import com.ges.web.GradeController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect GradeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String GradeController.create(@Valid Grade grade, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, grade);
            return "grades/create";
        }
        uiModel.asMap().clear();
        grade.persist();
        return "redirect:/grades/" + encodeUrlPathSegment(grade.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String GradeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Grade());
        return "grades/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String GradeController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("grade", Grade.findGrade(id));
        uiModel.addAttribute("itemId", id);
        return "grades/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String GradeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("grades", Grade.findGradeEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Grade.countGrades() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("grades", Grade.findAllGrades(sortFieldName, sortOrder));
        }
        return "grades/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String GradeController.update(@Valid Grade grade, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, grade);
            return "grades/update";
        }
        uiModel.asMap().clear();
        grade.merge();
        return "redirect:/grades/" + encodeUrlPathSegment(grade.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String GradeController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Grade.findGrade(id));
        return "grades/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String GradeController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Grade grade = Grade.findGrade(id);
        grade.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/grades";
    }
    
    void GradeController.populateEditForm(Model uiModel, Grade grade) {
        uiModel.addAttribute("grade", grade);
        uiModel.addAttribute("subjects", Subject.findAllSubjects());
    }
    
    String GradeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
