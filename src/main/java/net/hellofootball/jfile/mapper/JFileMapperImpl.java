package net.hellofootball.jfile.mapper;

import java.util.List;


import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import net.hellofootball.jfile.service.JFileDetails;
import net.hellofootball.jfile.service.impl.JFileVO;

@Component
public class JFileMapperImpl extends SqlSessionDaoSupport implements JFileMapper {
	protected final Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Override
	public void addAttachFile(JFileDetails fileVo) {
		getSqlSession().insert("addAttachFile", fileVo);
	}

	@Override
	public JFileVO selectAttachFile(JFileVO fileVO) {
		return getSqlSession().selectOne("selectAttachFile", fileVO);
	}

	@Override
	public List<JFileDetails> selectAttachFiles(JFileVO fileVO) {
		return getSqlSession().selectList("selectAttachFiles", fileVO);
	}

	@Override
	public void updateAttachFileDeleteYnByFileId(JFileVO fileVO) {
		getSqlSession().update("updateAttachFileDeleteYnByFileId", fileVO);
	}

	@Override
	public void updateAttachFileDownloadCount(JFileVO fileVO) {
		getSqlSession().update("updateAttachFileDownloadCount", fileVO);
	}

	@Override
	public void removeAttachFile(JFileVO fileVO) {
		getSqlSession().delete("removeAttachFile", fileVO);
	}

	@Override
	public Object[] getAttachFileSeqs(String fileId) {
		return getSqlSession().selectOne("getAttachFileSeqs", fileId);
	}

	@Override
	public void updateAttachFileDeleteYn(JFileVO fileVO) {
		getSqlSession().update("updateAttachFileDeleteYn", fileVO);
	}

	@Override
	public boolean isExistingAttachFileInfo(JFileVO fileVO) {
		return getSqlSession().selectOne("isExistingAttachFileInfo", fileVO);
	}

	@Override
	public void updateAttachFileDownloadCountBySequence(JFileVO jfileVO) {
		getSqlSession().update("updateAttachFileDownloadCountBySequence", jfileVO);		
	}

	@Override
	public void updateAttachFileDownloadCountByFileId(String fileId) {
		getSqlSession().update("updateAttachFileDownloadCountByFileId", fileId);
	}

}
