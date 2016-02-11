package com.angle.env;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Token;
import org.apache.lucene.analysis.kr.KoreanTokenizer;
import org.apache.lucene.analysis.kr.morph.AnalysisOutput;
import org.apache.lucene.analysis.kr.morph.MorphAnalyzer;
import org.springframework.stereotype.Component;

import com.angle.domain.PostContent;
import com.angle.domain.PostTag;

@Component
public class LuceneKoreanAnalyzer {

	private ArrayList<PostContent> pConList;
	private ArrayList<PostTag> pTagList;

	@SuppressWarnings({ "unchecked", "deprecation" })
	public ArrayList<PostTag> getTags(Object obj) {

		int pNo = 0;

		if (obj instanceof ArrayList<?>) {

			// 포스트 작성 완료
			if (((ArrayList<?>) obj).get(0) instanceof PostContent) {

				pConList = (ArrayList<PostContent>) obj;
				pTagList = new ArrayList<>();
				pNo = pConList.get(0).getpNo();

				for (PostContent pCon : pConList) {

					String question = pCon.getContent();

					try {

						if (!"".equals(question)) {

							MorphAnalyzer analyzer = new MorphAnalyzer();
							KoreanTokenizer tokenizer = new KoreanTokenizer(new StringReader(question));

							Token token = null;

							// 형태소 분석

							while ((token = tokenizer.next()) != null) {

								try {

									analyzer.setExactCompound(false);

									List<AnalysisOutput> results = analyzer.analyze(token.termText());

									for (AnalysisOutput o : results) {

										String pos = String.valueOf(o.getPos());

										if (("N".equals(pos) && o.getScore() >= 70
												&& o.getStem().toString().length() >= 2)
												|| ("N".equals(pos) && o.getStem().toString().length() == 3
														&& !(o.getStem().toString().equals("입니다")))
														&& o.getStem().toString().length() >= 2) {
											// 것, 그들, 이상

											PostTag pTag = new PostTag();

											pTag.setpNo(pNo);
											pTag.setTag(o.getStem().toString());
											pTag.setCount(1);

											pTagList.add(pTag);

										}
									}
								} catch (Exception e) {

									e.printStackTrace();

								}
							}

						}
					} catch (Exception e) {

						e.printStackTrace();

					}
				}
			} else {
			}

		}

		return pTagList;

	}
}