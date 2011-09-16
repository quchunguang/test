import java.io.File;
import java.io.FileNotFoundException;

import org.jgap.Chromosome;
import org.jgap.Configuration;
import org.jgap.FitnessFunction;
import org.jgap.Gene;
import org.jgap.Genotype;
import org.jgap.IChromosome;
import org.jgap.UnsupportedRepresentationException;
import org.jgap.data.DataTreeBuilder;
import org.jgap.data.IDataCreators;
import org.jgap.impl.DefaultConfiguration;
import org.jgap.impl.IntegerGene;
import org.jgap.xml.XMLDocumentBuilder;
import org.jgap.xml.XMLManager;
import org.w3c.dom.Document;

public class GADemo {

	/* From http://blog.sina.com.cn/s/blog_62cd5a980100ibes.html
	 *      http://jgap.sourceforge.net/doc/tutorial.html
	 *    1. 设计自己的染色体(Chromosome)
     *    2. 实现适应度函数
     *    3. 设置Configuration 对象
     *    4. 建立一个种群(可能的解集)
     *    5. 开始进化(运行遗传算法) 
	 */
	public static void main(String[] args) throws Exception {
		Configuration conf = new DefaultConfiguration();
		conf.setPreservFittestIndividual(true);
		FitnessFunction myfunction = new GADemoFunctionFitness();
		conf.setFitnessFunction(myfunction);
		Gene[] sampleGene = new Gene[2];
		sampleGene[0] = new IntegerGene(conf, 0, 9999999);
		sampleGene[1] = new IntegerGene(conf, 0, 9999999);
		IChromosome samplechromosome = new Chromosome(conf, sampleGene);
		conf.setSampleChromosome(samplechromosome);
		conf.setPopulationSize(80);
		Genotype popution;
		try {
			Document doc = XMLManager.readFile(new File("GADemo.xml"));
			popution = XMLManager.getGenotypeFromDocument(conf, doc);
		} catch (UnsupportedRepresentationException uex) {
			popution = Genotype.randomInitialGenotype(conf);
		} catch (FileNotFoundException e) {
			popution = Genotype.randomInitialGenotype(conf);
		}
		long starttime = System.currentTimeMillis();
		for (int i = 0; i < 50; i++) {
			popution.evolve();
		}
		long endtime = System.currentTimeMillis();
		System.out.println("the total evolve time:" + (endtime - starttime));
		IChromosome bestSolutionSoFar = popution.getFittestChromosome();
		System.out.println(GADemoFunctionFitness.getValueAtGene(
				bestSolutionSoFar, 0));
		System.out.println(GADemoFunctionFitness.getValueAtGene(
				bestSolutionSoFar, 1));
		DataTreeBuilder builder = DataTreeBuilder.getInstance();
		IDataCreators doc2 = builder.representGenotypeAsDocument(popution);
		XMLDocumentBuilder docbuilder = new XMLDocumentBuilder();
		Document xmlDoc = (Document) docbuilder.buildDocument(doc2);
		XMLManager.writeFile(xmlDoc, new File("GADemo.xml"));

	}

}
