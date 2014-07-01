package com.springapp.mvc.service;

import com.springapp.mvc.BaseTest;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.project.*;
import com.springapp.mvc.service.project.ProjectService;
import com.sun.xml.internal.rngom.ast.builder.CommentList;
import junit.framework.TestCase;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by lion on 14-4-20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ProjectServiceTest extends BaseTest {

    @Autowired
    private ProjectService projectService;

    @Test
    public void testFuzzySelectProject() throws Exception {
        List<Project> projectList;
        projectList = projectService.fuzzySelectProject(1, "6", 1);
        Assert.assertEquals(projectList.size(), 1);
        projectList = projectService.fuzzySelectProject(1, "啦啦", 1);
        Assert.assertEquals(projectList.size(), 0);
    }

    @Test
    public void testSelectProjectListByUserId() throws Exception {
        List<Project> projectList;
        projectList = projectService.selectProjectListByUserId(1, 1);
        Assert.assertEquals(projectList.size(), 1);
    }

    @Test
    public void testFuzzySelectUserList() throws Exception {
        List<User> userList = projectService.fuzzySelectUserList("卢", 1);
        Assert.assertEquals(userList.size(), 1);
    }

    @Test
    public void testFuzzySelectCustomerNotLink() throws Exception {
        List<Customer> customerList = projectService.fuzzySelectCustomerNotLink("客户", 1);
        Assert.assertEquals(customerList.size(), 1);
    }

    @Test
    public void testGetProjectDetail() throws Exception {
        Project project = projectService.getProjectDetail(1);
    }

    @Test
    public void testGetProjectCommentList() throws Exception {
        List<CommentProject> commentProjectList = projectService.getProjectCommentList(1, 1);
    }

    @Test
    public void testInsertProjectComment() throws Exception {
        CommentProject commentProject = new CommentProject();
        commentProject.setDetails("just for test.");
        commentProject.setUserId(3);
        commentProject.setProjectId(1);
//        projectService.insertProjectComment(commentProject);
    }

    @Test
    public void testInsertProject() throws Exception {
        Project project = new Project();

        project.setName("testProject");
        project.setStageId(1);
        project.setInfo("i`m a project for test.");
        project.setCreaterId(1);
        project.setCompanyId(1);

//        projectService.insertProject(project);
    }

    @Test
    public void testDeleteProjectByProjectId() throws Exception {
        //projectService.deleteProjectByProjectId(4);
    }

    @Test
    public void testGetProjectManagerList() throws Exception {
        List<User> userList = projectService.getProjectManagerList(1, 1);
    }

    @Test
    public void testGetProjectCustomerList() throws Exception {
        List<Customer> customerList = projectService.getProjectCustomerList(1, 1);
    }

    @Test
    public void testGetProjectMemberList() throws Exception {
        List<User> userList = projectService.getProjectMemberList(1, 1);
    }

    @Test
    public void testUpdateProjectDetail() throws Exception {
        Project project = projectService.getProjectDetail(1);
        String oldName = project.getName();
        String newName = "项目名字被改了";
        project.setName(newName);
        projectService.updateProjectDetail(project);
        Assert.assertEquals(projectService.getProjectDetail(1).getName(), newName);
        project.setName(oldName);
        projectService.updateProjectDetail(project);
        Assert.assertEquals(projectService.getProjectDetail(1).getName(), oldName);
    }

    @Test
    public void testInsertProjectManagerLink() throws Exception {
        projectService.insertProjectManagerLink(1, 10);
    }

    @Test
    public void testDeleteProjectManagerLink() throws Exception {
        projectService.deleteProjectManagerLink(1, 10);
    }

    @Test
    public void testInsertProjectCustomerLink() throws Exception {
        projectService.insertProjectCustomerLink(1, 5);
    }

    @Test
    public void testDeleteProjectCustomerLink() throws Exception {
        projectService.deleteProjectCustomerLink(1, 5);
    }

    @Test
    public void testInsertProjectMemberLink() throws Exception {
        projectService.insertProjectMemberLink(1, 10);
    }

    @Test
    public void testDeleteProjectMemberLink() throws Exception {
        projectService.deleteProjectMemberLink(1, 10);
    }

    @Test
    public void testDeleteModuleByModuleId() throws Exception {
//        projectService.deleteModuleByModuleId(9);
    }

//    @Test
//    public void testGetModuleList() throws Exception {
//        List<Module> moduleList = projectService.getModuleList(1);
//        Assert.assertEquals(moduleList.size(), 4);
//    }

    @Test
    public void testGetModuleListByUserIdAndProjectId() throws Exception{
        List<Module> moduleList = projectService.getModuleListByUserIdAndProjectId(4, 1, 1);
        Assert.assertEquals(moduleList.size(), 2);
    }

    @Test
    public void testInsertModule() throws Exception {
        Module module = new Module();
        module.setName("testModule");
        module.setProjectId(1);
        module.setCreaterId(3);
//        projectService.insertModule(module);
    }

    @Test
    public void testGetModuleDetail() throws Exception {
        Module module = projectService.getModuleDetail(8);
    }

    @Test
    public void testGetModuleManagerList() throws Exception {
        List<User> userList = projectService.getModuleManagerList(1, 1);
    }

    @Test
    public void testGetModuleCustomerList() throws Exception {
        List<Customer> customerList = projectService.getModuleCustomerList(1, 1);
    }

    @Test
    public void testGetModuleMemberList() throws Exception {
        List<User> userList = projectService.getModuleMemberList(1, 1);
    }

    @Test
    public void testUpdateModuleDetail() throws Exception {
        Module module = projectService.getModuleDetail(1);
        String oldName = module.getName();
        String newName = "模块名字被改了";
        module.setName(newName);
        projectService.updateModuleDetail(module);
        Assert.assertEquals(projectService.getModuleDetail(1).getName(), newName);
        module.setName(oldName);
        projectService.updateModuleDetail(module);
        Assert.assertEquals(projectService.getModuleDetail(1).getName(), oldName);
    }

    @Test
    public void testInsertModuleManagerLink() throws Exception {
        projectService.insertModuleManagerLink(1, 10);
    }

    @Test
    public void testDeleteModuleManagerLink() throws Exception {
        projectService.deleteModuleManagerLink(1, 10);
    }

    @Test
    public void testInsertModuleCustomerLink() throws Exception {
        projectService.insertModuleCustomerLink(1, 5);
    }

    @Test
    public void testDeleteModuleCustomerLink() throws Exception {
        projectService.deleteModuleCustomerLink(1, 5);
    }

    @Test
    public void testInsertModuleMemberLink() throws Exception {
        projectService.insertModuleMemberLink(1, 10);
    }

    @Test
    public void testDeleteModuleMemberLink() throws Exception {
        projectService.deleteModuleMemberLink(1, 10);
    }

    @Test
    public void testDeleteTaskByTaskId() throws Exception {
//        projectService.deleteTaskByTaskId(10);
    }

//    @Test
//    public void testGetTaskList() throws Exception {
//        List<Task> taskList = projectService.getTaskList(1);
//        Assert.assertEquals(taskList.size(), 1);
//    }

    @Test
    public void testGetTaskListByUserIdAndModuleId() throws Exception{
        List<Task> taskList = projectService.getTaskListByUserIdAndModuleId(1, 5, 1);
        Assert.assertEquals(taskList.size(), 0);
    }

    @Test
    public void testInsertTask() throws Exception {
        Task task = new Task();
        task.setName("testModule");
        task.setModuleId(1);
        Timestamp deadline = new Timestamp(System.currentTimeMillis());
        task.setDeadline(deadline);
        task.setCreaterId(3);
        task.setPriorityId(1);
        task.setStageId(1);
//        projectService.insertTask(task);
    }

    @Test
    public void testGetAllProjectStageList() throws Exception {
        List<ProjectStage> projectStageList = projectService.getAllProjectStageList();
        Assert.assertEquals(projectStageList.size(), 4);
    }

    @Test
    public void testGetAllPriorityList() throws Exception {
        List<Priority> priorityList = projectService.getAllPriorityList();
        Assert.assertEquals(priorityList.size(), 3);
    }

    @Test
    public void testGetTaskDetail() throws Exception {
        Task task = projectService.getTaskDetail(1);
    }

    @Test
    public void testGetTaskManagerList() throws Exception {
        List<User> userList = projectService.getTaskManagerList(1, 1);
    }

    @Test
    public void testGetTaskCustomerList() throws Exception {
        List<Customer> customerList = projectService.getTaskCustomerList(1, 1);
    }

    @Test
    public void testGetTaskMemberList() throws Exception {
        List<User> userList = projectService.getTaskMemberList(1, 1);
    }

    @Test
    public void testSelectSubTaskListByTaskId() throws Exception {
        List<SubTask> subTaskList = projectService.selectSubTaskListByTaskId(1);
        Assert.assertEquals(subTaskList.size(), 1);
    }

    @Test
    public void testUpdateTaskDetail() throws Exception {
        Task task = projectService.getTaskDetail(1);
        String oldName = task.getName();
        String newName = "任务名字被改了";
        task.setName(newName);
        projectService.updateTaskDetail(task);
        Assert.assertEquals(projectService.getTaskDetail(1).getName(), newName);
        task.setName(oldName);
        projectService.updateTaskDetail(task);
        Assert.assertEquals(projectService.getTaskDetail(1).getName(), oldName);
    }

    @Test
    public void testInsertTaskManagerLink() throws Exception {
        projectService.insertTaskManagerLink(1, 10);
    }

    @Test
    public void testDeleteTaskManagerLink() throws Exception {
        projectService.deleteTaskManagerLink(1, 10);
    }

    @Test
    public void testInsertTaskCustomerLink() throws Exception {
        projectService.insertTaskCustomerLink(1, 7);
    }

    @Test
    public void testDeleteTaskCustomerLink() throws Exception {
        projectService.deleteTaskCustomerLink(1, 7);
    }

    @Test
    public void testInsertTaskMemberLink() throws Exception {
        projectService.insertTaskMemberLink(1, 10);
    }

    @Test
    public void testDeleteTaskMemberLink() throws Exception {
        projectService.deleteTaskMemberLink(1, 10);
    }

    @Test
    public void testInsertSubTask() throws Exception {
        SubTask subTask = new SubTask();
        subTask.setTaskId(1);
        subTask.setName("subTask for test.");
        subTask.setUnderway(false);
//        projectService.insertSubTask(subTask);
    }

    @Test
    public void testDeleteSubTask() throws Exception {
//        projectService.deleteSubTask(4);
    }

    @Test
    public void testUpdateSubTaskState() throws Exception {
        projectService.updateSubTaskState(1, false);
        projectService.updateSubTaskState(1, true);
    }

    @Test
    public void testInsertCommentTask() throws Exception {
        CommentTask commentTask = new CommentTask();
        commentTask.setDetails("just for test.");
        commentTask.setUserId(3);
        commentTask.setTaskId(1);
//        projectService.insertCommentTask(commentTask);
    }

    @Test
    public void testGetTaskCommentList() throws Exception {
        List<CommentTask> commentTaskList = projectService.getTaskCommentList(1, 1);
    }

    @Test
    public void testIsProjectCreater() throws Exception {
        Assert.assertEquals(projectService.isProjectCreater(1, 1), true);
        Assert.assertEquals(projectService.isProjectCreater(1, 2), false);
    }

    @Test
    public void testIsModuleCreater() throws Exception {
        Assert.assertEquals(projectService.isModuleCreater(1, 1), true);
        Assert.assertEquals(projectService.isModuleCreater(2, 1), false);
    }

    @Test
    public void testIsTaskCreater() throws Exception {
        Assert.assertEquals(projectService.isTaskCreater(1, 1), true);
        Assert.assertEquals(projectService.isTaskCreater(2, 1), false);
    }

    @Test
    public void testIsProjectManager() throws Exception {
        Assert.assertEquals(projectService.isProjectManager(3, 1), true);
        Assert.assertEquals(projectService.isProjectManager(4, 1), false);
    }

    @Test
    public void testIsModuleManager() throws Exception {
        Assert.assertEquals(projectService.isModuleManager(4, 1), true);
        Assert.assertEquals(projectService.isModuleManager(5, 1), false);
    }

    @Test
    public void testIsTaskManager() throws Exception {
        Assert.assertEquals(projectService.isTaskManager(8, 1), true);
        Assert.assertEquals(projectService.isTaskManager(9, 1), false);
    }

    @Test
    public void testIsProjectMember() throws Exception {
        Assert.assertEquals(projectService.isProjectMember(12, 1), true);
        Assert.assertEquals(projectService.isProjectMember(11, 1), false);
    }

    @Test
    public void testIsModuleMember() throws Exception {
        Assert.assertEquals(projectService.isModuleMember(14, 1), true);
        Assert.assertEquals(projectService.isModuleMember(13, 1), false);
    }

    @Test
    public void testIsTaskMember() throws Exception {
        Assert.assertEquals(projectService.isTaskMember(16, 1), true);
        Assert.assertEquals(projectService.isTaskMember(15, 1), false);
    }
}
