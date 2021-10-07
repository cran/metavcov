\name{Craft2003}
\alias{Craft2003}
\docType{data}
\title{Correlation Coefficients Data from the Craft et al. Meta-Analysis}
\description{
This dataset includes 18 studies of correlation coefficients reported by Craft, Magyar, Becker, and
Feltz (2003).}
\usage{data(Craft2003)}
\details{The primary purpose of Craft and colleagues' meta-analysis was to examine the interrelationships between athletic performance and three subscales, cognitive anxiety, somatic anxiety, and self-concept, of the Competitive State Anxiety Inventory (CSAI 2; CITATION). In this meta-analysis, the correlation coefficient was the primary effect size measure. For the purpose of demonstration, I use a subset of the data, i.e., six correlation coefficients among cognitive anxiety, somatic anxiety, self-concept, and sport performance in athletes.

\tabular{ll}{
ID \tab ID for each study included\cr
N \tab Sample size from each study included\cr
gender \tab Gender\cr
p_male \tab Percentage of male \cr
C1 \tab Correlation coefficient between cognitive anxiety and somatic anxiety \cr
C2 \tab Correlation coefficient between cognitive anxiety and self concept \cr
C3 \tab Correlation coefficient between cognitive anxiety and athletic performance \cr
C4 \tab Correlation coefficient between somatic anxiety and self concept \cr
C5 \tab Correlation coefficient between somatic anxiety and athletic performance \cr
C6 \tab Correlation coefficient between self concept and athletic performance \cr
}}
\examples{
  data(Craft2003)
}
\source{
Craft, L. L., Magyar, T. M., Becker, B. J., & Feltz, D. L. (2003). The relationship between the competitive state anxiety inventory-2 and sport performance: a meta-analysis. \emph{Journal of Sport and Exercise Psychology, 25}(1), 44-65.
}


