package com.springapp.mvc.dao.project;

import com.springapp.mvc.domain.project.ProjectStage;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lion on 14-4-20.
 */
@Repository
public interface ProjectStageMapper {

    // 得到 所有进度阶段列表
    public List<ProjectStage> getAllProjectStageList();
}
