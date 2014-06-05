package com.springapp.mvc.service.project;

import com.springapp.mvc.dao.LinkMapper;
import com.springapp.mvc.dao.contacts.UserMapper;
import com.springapp.mvc.dao.customer.CustomerMapper;
import com.springapp.mvc.dao.project.*;
import com.springapp.mvc.domain.contacts.User;
import com.springapp.mvc.domain.customer.Customer;
import com.springapp.mvc.domain.project.*;
import com.tool.DateHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by luhuanglh on 14-4-4.
 */
@Service
@Transactional
public class ProjectService {

    @Autowired
    private ProjectMapper projectMapper;
    @Autowired
    private ModuleMapper moduleMapper;
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private SubTaskMapper subTaskMapper;
    @Autowired
    private CommentProjectMapper commentProjectMapper;
    @Autowired
    private CommentTaskMapper commentTaskMapper;
    @Autowired
    private ProjectStageMapper projectStageMapper;
    @Autowired
    private PriorityMapper priorityMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private CustomerMapper customerMapper;
    @Autowired
    private LinkMapper linkMapper;

    // 模糊搜索 项目
    public List<Project> fuzzySelectProject(int userId, String str) {
        Map<String, String> map = new HashMap<String, String>();
        map.put("userId", Integer.toString(userId));
        map.put("str", str);
        return projectMapper.fuzzySelectProjectBaseInfoListByUserId(map);
    }

    // 根据 成员id 得到 项目基本信息列表
    public List<Project> selectProjectListByUserId(int userId) {
        List<Project> projectList = projectMapper.selectProjectListWithProjectCreatorByUserId(userId);
        projectList.addAll(projectMapper.selectProjectListWithProjectManagerByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithProjectMemberByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithModuleCreatorByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithModuleManagerByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithModuleMemberByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithTaskCreatorByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithTaskManagerByUserId(userId));
        projectList.addAll(projectMapper.selectProjectListWithTaskMemberByUserId(userId));

        List<Project> returnProjectList = new LinkedList<Project>();
        for (Project project : projectList) {
            boolean contain = false;
            for (Project returnProject : returnProjectList) {
                if (project.getId() == returnProject.getId())
                    contain = true;
            }
            if (contain == false)
                returnProjectList.add(project);
        }

        for (Project project : returnProjectList) {
            String displayString = DateHelper.dateToString(project.getUpdateTime());
            project.setDisplayUpdateTime(displayString);
        }
        return returnProjectList;
    }

    // 模糊搜索 成员基本资料 列表
    public List<User> fuzzySelectUserList(String str) {
        return userMapper.fuzzySelectUserBaseInfoListByString(str);
    }

    // 模糊搜索 未关联项目/模块/任务 客户 列表
    public List<Customer> fuzzySelectCustomerNotLink(String str) {
        List<Customer> customerList = customerMapper.fuzzySelectCustomer(str);
        List<Customer> customerListNotLink = new LinkedList<Customer>();
        for (Customer customer : customerList) {
            if (customer.getProjectId() == null && customer.getModuleId() == null && customer.getTaskId() == null)
                customerListNotLink.add(customer);
        }
        return customerListNotLink;
    }

    // 根据 项目id 找 项目详细信息
    public Project getProjectDetail(int projectId) {
        return projectMapper.selectProjectDetailsByProjectId(projectId);
    }

    // 根据 项目id 找 项目评论列表
    public List<CommentProject> getProjectCommentList(int projectId) {
        List<CommentProject> commentProjectList = commentProjectMapper.selectProjectCommentListByProjectId(projectId);
        for (CommentProject commentProject : commentProjectList) {
            String displayTime = DateHelper.getShortTime(commentProject.getTime());
            commentProject.setDisplayTime(displayTime);
        }
        return commentProjectList;
    }

    // 插入 项目评论
    public Integer insertProjectComment(CommentProject commentProject) {
        return commentProjectMapper.insertProjectComment(commentProject);
    }

    // 插入 项目
    public Integer insertProject(Project project) {
        return projectMapper.insertProject(project);
    }

    // 删除 项目
    public Integer deleteProjectByProjectId(int projectId) {
        List<Module> moduleList = moduleMapper.selectModuleListByProjectId(projectId);
        for (Module module : moduleList) {
            deleteModuleByModuleId(module.getId());
        }

        linkMapper.deleteAllProjectManagerLinkByProjectId(projectId);
        linkMapper.deleteAllProjectCustomerLinkByProjectId(projectId);
        linkMapper.deleteAllProjectMemberLinkByProjectId(projectId);
        commentProjectMapper.deleteAllProjectCommentByProjectId(projectId);
        return projectMapper.deleteProjectDetailByProjectId(projectId);
    }

    // 根据 项目id 找 项目负责人基本资料 列表
    public List<User> getProjectManagerList(int projectId) {
        return userMapper.selectProjectManagerListByProjectId(projectId);
    }

    // 根据 项目id 找 项目关联客户基本资料 列表
    public List<Customer> getProjectCustomerList(int projectId) {
        return customerMapper.selectProjectCustomerListByProjectId(projectId);
    }

    // 更新 项目详细资料
    public void updateProjectDetail(Project project) {
        projectMapper.updateProjectDetail(project);
    }

    // 插入 项目与负责人 关联
    public Integer insertProjectManagerLink(int projectId, int userId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("projectId", projectId);
        map.put("managerId", userId);
        map.put("companyId", companyId);
        return linkMapper.insertProjectManagerLink(map);
    }

    // 删除 项目与负责人 关联
    public Integer deleteProjectManagerLink(int projectId, int userId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("projectId", projectId);
        map.put("managerId", userId);
        return linkMapper.deleteProjectManagerLink(map);
    }

    // 插入 项目关联客户
    public Integer insertProjectCustomerLink(int projectId, int customerId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("projectId", projectId);
        map.put("customerId", customerId);
        map.put("companyId", companyId);
        return linkMapper.insertProjectCustomerLink(map);
    }

    // 删除 项目关联客户
    public Integer deleteProjectCustomerLink(int projectId, int customerId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("projectId", projectId);
        map.put("customerId", customerId);
        return linkMapper.deleteProjectCustomerLink(map);
    }

    // 插入 项目与成员 关联
    public Integer insertProjectMemberLink(int projectId, int memberId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("projectId", projectId);
        map.put("memberId", memberId);
        map.put("companyId", companyId);
        return linkMapper.insertProjectMemberLink(map);
    }

    // 删除 项目与成员 关联
    public Integer deleteProjectMemberLink(int projectId, int memberId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("projectId", projectId);
        map.put("memberId", memberId);
        return linkMapper.deleteProjectMemberLink(map);
    }

    // 删除 模块
    public Integer deleteModuleByModuleId(int moduleId) {

        List<Task> taskList = taskMapper.selectTaskListByModuleId(moduleId);
        for (Task task : taskList) {
            deleteTaskByTaskId(task.getId());
        }

        linkMapper.deleteAllModuleManagerLinkByModuleId(moduleId);
        linkMapper.deleteAllModuleCustomerLinkByModuleId(moduleId);
        linkMapper.deleteAllModuleMemberLinkByModuleId(moduleId);
        return moduleMapper.deleteModuleDetailByModuleId(moduleId);
    }

    // 根据 项目id 找 模块列表
//    public List<Module> getModuleList(int projectId){
//        return moduleMapper.selectModuleListByProjectId(projectId);
//    }

    // 根据 成员id 和 项目id 找 模块列表
    public List<Module> getModuleListByUserIdAndProjectId(int userId, int projectId) {
        if (isProjectCreater(userId, projectId) ||
                isProjectManager(userId, projectId) ||
                isProjectMember(userId, projectId)) {
            return moduleMapper.selectModuleListByProjectId(projectId);
        } else {
            Map<String, Integer> map = new HashMap<String, Integer>();
            map.put("userId", userId);
            map.put("projectId", projectId);
            return moduleMapper.getModuleListByUserIdAndProjectId(map);
        }
    }

    // 插入 模块
    public Integer insertModule(Module module) {
        return moduleMapper.insertModule(module);
    }

    // 根据 模块id 找 模块详细资料
    public Module getModuleDetail(int moduleId) {
        return moduleMapper.selectModuleDetailsByModuleId(moduleId);
    }

    // 根据 模块id 找 模块负责人基本资料 列表
    public List<User> getModuleManagerList(int moduleId) {
        return userMapper.selectModuleManagerListByModuleId(moduleId);
    }

    // 根据 模块id 找 模块关联客户基本资料 列表
    public List<Customer> getModuleCustomerList(int moduleId) {
        return customerMapper.selectModuleCustomerListByModuleId(moduleId);
    }

    // 更新 模块详细资料
    public void updateModuleDetail(Module module) {
        moduleMapper.updateModuleDetail(module);
    }

    // 插入 模块与负责人 关联
    public Integer insertModuleManagerLink(int moduleId, int userId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("moduleId", moduleId);
        map.put("managerId", userId);
        map.put("companyId", companyId);
        return linkMapper.insertModuleManagerLink(map);
    }

    // 删除 模块与负责人 关联
    public Integer deleteModuleManagerLink(int moduleId, int userId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("moduleId", moduleId);
        map.put("managerId", userId);
        return linkMapper.deleteModuleManagerLink(map);
    }

    // 插入 模块关联客户
    public Integer insertModuleCustomerLink(int moduleId, int customerId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("moduleId", moduleId);
        map.put("customerId", customerId);
        map.put("companyId", companyId);
        return linkMapper.insertModuleCustomerLink(map);
    }

    // 删除 模块关联客户
    public Integer deleteModuleCustomerLink(int moduleId, int customerId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("moduleId", moduleId);
        map.put("customerId", customerId);
        return linkMapper.deleteModuleCustomerLink(map);
    }

    // 插入 模块与成员 关联
    public Integer insertModuleMemberLink(int moduleId, int memberId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("moduleId", moduleId);
        map.put("memberId", memberId);
        map.put("companyId", companyId);
        return linkMapper.insertModuleMemberLink(map);
    }

    // 删除 模块与成员 关联
    public Integer deleteModuleMemberLink(int moduleId, int memberId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("moduleId", moduleId);
        map.put("memberId", memberId);
        return linkMapper.deleteModuleMemberLink(map);
    }

    // 删除 任务
    public Integer deleteTaskByTaskId(int taskId) {
        linkMapper.deleteAllTaskManagerLinkByTaskId(taskId);
        linkMapper.deleteAllTaskCustomerLinkByTaskId(taskId);
        linkMapper.deleteAllTaskMemberLinkByTaskId(taskId);
        commentTaskMapper.deleteAllTaskCommentByTaskId(taskId);
        subTaskMapper.deleteAllSubTaskByTaskId(taskId);
        return taskMapper.deleteTaskDetailByTaskId(taskId);
    }

    // 根据 模块id 找 任务列表
//    public List<Task> getTaskList(int moduleId){
//        return taskMapper.selectTaskListByModuleId(moduleId);
//    }

    // 根据 成员id 和 模块id 找 任务列表
    public List<Task> getTaskListByUserIdAndModuleId(int userId, int moduleId) {
        if (isModuleCreater(userId, moduleId) ||
                isModuleManager(userId, moduleId) ||
                isModuleMember(userId, moduleId)) {
            return taskMapper.selectTaskListByModuleId(moduleId);
        } else {
            Map<String, Integer> map = new HashMap<String, Integer>();
            map.put("userId", userId);
            map.put("moduleId", moduleId);
            return taskMapper.getTaskListByUserIdAndModuleId(map);
        }

    }

    // 插入 任务
    public Integer insertTask(Task task) {
        return taskMapper.insertTask(task);
    }

    // 得到 所有进度阶段列表
    public List<ProjectStage> getAllProjectStageList() {
        return projectStageMapper.getAllProjectStageList();
    }

    // 得到 所有优先级列表
    public List<Priority> getAllPriorityList() {
        return priorityMapper.getAllPriorityList();
    }

    // 根据 任务id 找 任务详细资料
    public Task getTaskDetail(int taskId) {
        return taskMapper.selectTaskDetailsByTaskId(taskId);
    }

    // 根据 任务id 找 任务负责人基本资料 列表
    public List<User> getTaskManagerList(int taskId) {
        return userMapper.selectTaskManagerListByTaskId(taskId);
    }

    // 根据 任务id 找 任务关联客户基本资料 列表
    public List<Customer> getTaskCustomerList(int taskId) {
        return customerMapper.selectTaskCustomerListByTaskId(taskId);
    }

    // 根据 任务id 找 拆分任务 列表
    public List<SubTask> selectSubTaskListByTaskId(int taskId) {
        return subTaskMapper.selectSubTaskListByTaskId(taskId);
    }

    // 更新 任务详细资料
    public void updateTaskDetail(Task task) {
        taskMapper.updateTaskDetail(task);
    }

    // 插入 任务与负责人 关联
    public Integer insertTaskManagerLink(int taskId, int userId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("taskId", taskId);
        map.put("managerId", userId);
        map.put("companyId", companyId);
        return linkMapper.insertTaskManagerLink(map);
    }

    // 删除 任务与负责人 关联
    public Integer deleteTaskManagerLink(int taskId, int userId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("taskId", taskId);
        map.put("managerId", userId);
        return linkMapper.deleteTaskManagerLink(map);
    }

    // 插入 任务关联客户
    public Integer insertTaskCustomerLink(int taskId, int customerId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("taskId", taskId);
        map.put("customerId", customerId);
        map.put("companyId", companyId);
        return linkMapper.insertTaskCustomerLink(map);
    }

    // 删除 任务关联客户
    public Integer deleteTaskCustomerLink(int taskId, int customerId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("taskId", taskId);
        map.put("customerId", customerId);
        return linkMapper.deleteTaskCustomerLink(map);
    }

    // 插入 任务与成员 关联
    public Integer insertTaskMemberLink(int taskId, int memberId, int companyId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("taskId", taskId);
        map.put("memberId", memberId);
        map.put("companyId", companyId);
        return linkMapper.insertTaskMemberLink(map);
    }

    // 删除 任务与成员 关联
    public Integer deleteTaskMemberLink(int taskId, int memberId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("taskId", taskId);
        map.put("memberId", memberId);
        return linkMapper.deleteTaskMemberLink(map);
    }

    // 插入 拆分任务
    public Integer insertSubTask(SubTask subTask) {
        return subTaskMapper.insertSubTask(subTask);
    }

    // 删除 拆分任务
    public Integer deleteSubTask(int subTaskId) {
        return subTaskMapper.deleteSubTask(subTaskId);
    }

    // 更新 拆分任务 开启状态
    public void updateSubTaskState(int subTaskId, boolean bool) {
        SubTask subTask = subTaskMapper.selectSubTaskBySubTaskId(subTaskId);
        subTask.setUnderway(bool);
        subTaskMapper.updateSubTaskState(subTask);
    }

    // 插入 任务评论
    public Integer insertCommentTask(CommentTask commentTask) {
        return commentTaskMapper.insertCommentTask(commentTask);
    }

    // 根据 任务id 找 任务评论列表
    public List<CommentTask> getTaskCommentList(int taskId) {
        return commentTaskMapper.selectCommentTaskListByTaskId(taskId);
    }

    // 判断 是否为 项目创建人
    public boolean isProjectCreater(int userId, int projectId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("projectId", projectId);
        return projectMapper.isProjectCreater(map).equals(1);
    }

    // 判断 是否为 模块创建人
    public boolean isModuleCreater(int userId, int moduleId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("moduleId", moduleId);
        return moduleMapper.isModuleCreater(map).equals(1);
    }

    // 判断 是否为 任务创建人
    public boolean isTaskCreater(int userId, int taskId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("taskId", taskId);
        return taskMapper.isTaskCreater(map).equals(1);
    }

    // 判断 是否为 项目负责人
    public boolean isProjectManager(int userId, int projectId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("projectId", projectId);
        return linkMapper.isProjectManager(map).equals(1);
    }

    // 判断 是否为 模块负责人
    public boolean isModuleManager(int userId, int moduleId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("moduleId", moduleId);
        return linkMapper.isModuleManager(map).equals(1);
    }

    // 判断 是否为 任务负责人
    public boolean isTaskManager(int userId, int taskId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("taskId", taskId);
        return linkMapper.isTaskManager(map).equals(1);
    }

    // 判断 是否为 项目成员
    public boolean isProjectMember(int userId, int projectId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("projectId", projectId);
        return linkMapper.isProjectMember(map).equals(1);
    }

    // 判断 是否为 模块成员
    public boolean isModuleMember(int userId, int moduleId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("moduleId", moduleId);
        return linkMapper.isModuleMember(map).equals(1);
    }

    // 判断 是否为 任务成员
    public boolean isTaskMember(int userId, int taskId) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("userId", userId);
        map.put("taskId", taskId);
        return linkMapper.isTaskMember(map).equals(1);
    }
}
