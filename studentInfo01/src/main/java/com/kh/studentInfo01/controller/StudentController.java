package com.kh.studentInfo01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.studentInfo01.domain.StudentVo;
import com.kh.studentInfo01.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Inject
	StudentService studentService;
	
	@RequestMapping(value="/listAll", method=RequestMethod.GET)
	public String listAll(Model model) throws Exception {
		List<StudentVo> list = studentService.selectAll();
		model.addAttribute("list", list);
		return "student/listAll";
	}
	
	@RequestMapping(value="/registForm", method=RequestMethod.GET)
	public String registForm() throws Exception {
		return "student/registForm";
	}
	
	@RequestMapping(value="/registRun", method=RequestMethod.POST)
	public String registRun(StudentVo studentVo) throws Exception {
		System.out.println(studentVo);
		studentService.insertStudent(studentVo);
		return "redirect:/student/listAll";
	}
	
	@RequestMapping(value="/deleteRun/sno/{sno}", method=RequestMethod.GET)
	public String deleteRun(@PathVariable("sno") String sno) throws Exception {
		studentService.deleteStudent(sno);
		return "redirect:/student/listAll";
	}
	
	@ResponseBody
	@RequestMapping(value="/modifyForm", method=RequestMethod.POST)
	public StudentVo modifyForm(@RequestBody StudentVo studentVo) throws Exception {
		System.out.println(studentVo.getSno());
		String sno = studentVo.getSno();
		StudentVo student = studentService.selectBySno(sno);
		System.out.println(student);
		return student;
	}
	
	@RequestMapping(value="/modifyRun", method=RequestMethod.POST)
	public String modifyRun(StudentVo studentVo) throws Exception {
		studentService.modifyStudent(studentVo);
		return "redirect:/student/listAll";
	}
}
