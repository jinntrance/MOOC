import scala.annotation.tailrec
import scala.io.Source

/**
 * @since 11/23/15
 */
object Djk {
  def main(args: Array[String]) {

    val dftValue = 1000000
    // store nodes and its neighbors
    val nodes = collection.mutable.Map[String, List[(String, Int, String)]]()
    Source.fromFile(args(0)).getLines().foreach(_.trim.split( """\s+""") match {
      case Array(node, tail@_*) =>
        nodes += node -> tail.map(t => {
          val Array(nxt, str) = t.split(",");
          (node, str.toInt, nxt)
        }).toList
    })

    val shortestPath = collection.mutable.Map[String, Int]()

    val start = "1"
    val targets = "7,37,59,82,99,115,133,165,188,197".split(",")

    @tailrec
    def helper(neighborEdges: List[(String, Int, String)]): Unit = neighborEdges match {
      case Nil=>
      case (pre, len, next) :: tail =>
        var (selectedV: String, sp: Int) = next -> (shortestPath.getOrElse(pre, 0) + len)
        tail.foreach {
          case (p, l, nxt) =>
            val shortest = shortestPath.getOrElse(p, 0) + l
            if (sp > shortest) {
              selectedV = nxt
              sp = shortest
            }
          case _ =>
        }

        shortestPath += selectedV -> sp

        // choose those edge whose next node is not explored
        val nodes2Explored =
          (neighborEdges ::: nodes.getOrElse(selectedV, Nil)).filter(next => !shortestPath.contains(next._3))
        helper(nodes2Explored)
    }

    // initialization
    val init = nodes.getOrElse(start, Nil)

    shortestPath += start -> 0
    helper(init)
    println(targets.map(p => shortestPath.getOrElse(p, dftValue)).mkString(","))

  }
}
