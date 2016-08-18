module Xpub
  module Markdown
    class Node
      def to_html
        return '' unless respond_to?(:content)
        if content.is_a?(Array)
          content.map(&:to_html).join
        elsif content.is_a?(Xpub::Markdown::Node)
          content.to_html
        elsif content
          content.to_s
        else
          ''
        end
      end

      def to_tex
        'no impl.'
      end

      def inspect
        if respond_to?(:content)
          '#<' + self.class.to_s + ' content="' + content.to_s + '">'
        else
          '#<' + self.class.to_s + '>'
        end
      end
    end

    class HeadlineNode
      def to_html
        children = content.map(&:to_html).join
        "<h#{level}>#{children}</h#{level}>\n"
      end
    end

    class TextNode
      def to_html
        content.to_s
      end
    end

    class BlockQuoteNode
      def to_html
        children = content.map(&:to_html).join
        "<blockquote>#{children}</blockquote>\n"
      end
    end

    class BulletListNode
      def to_html
        children = content.map(&:to_html).join
        "<ul>\n#{children}</ul>\n"
      end
    end

    class BulletListItemNode
      def to_html
        children = content.map(&:to_html).join
        "<li>#{children}</li>\n"
      end
    end

    class PlainNode
      def to_html
        content.map(&:to_html).join
      end
    end

    class ParaNode
      def to_html
        children = content.map(&:to_html).join
        "<p>#{children}</p>\n"
      end
    end

    class VerbatimNode
      def to_html
        children = content.map(&:to_html).join
        "<pre><code>#{children}</code></pre>\n"
      end
    end

    class InlineElementNode
      def to_html
        children = content.map(&:to_html).join
        "<#{name}>#{children}</#{name}>"
      end

      def inspect
        '#<' + self.class.to_s + ' name="' + name.to_s + '" content="' + content.to_s + '">'
      end
    end

    class LineBreakNode
      def to_html
        "<br />\n"
      end

      def inspect
        '\n'
      end
    end

    class HorizontalRuleNode
      def to_html
        "<hr />\n"
      end
    end
  end
end
