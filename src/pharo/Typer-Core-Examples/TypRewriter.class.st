Class {
	#name : #TypRewriter,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #accessing }
TypRewriter >> rewrite [
	<gtExample>
	^ ((RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]) flatCollect: #methods)
		select: [ :e | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter replace: '`@r copyWithParameters: {''@A'' -> `@a} asDictionary' with: '`@r copyWithParameters: {`@a}'.
			ok := rewriter executeTree: e parseTree.
			ok
				ifTrue:
					[ e origin compile: rewriter tree formattedCode classified: e protocol ].
			ok ]
]
