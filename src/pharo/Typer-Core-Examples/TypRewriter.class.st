Class {
	#name : #TypRewriter,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #accessing }
TypRewriter >> normalizeSelector: aSymbol at: anInteger [
	aSymbol isUnary
		ifTrue: [ ^ ('m' , aSymbol capitalized , ':') asSymbol ].
	aSymbol isBinary
		ifTrue: [ ^ ('mBinary' , anInteger asString , ':') asSymbol ].
	^ ((aSymbol keywords
		inject: 'm'
		into: [ :r :f | r , (f capitalized copyFrom: 1 to: f size - 1) ])
		, ':') asSymbol
]

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

{ #category : #accessing }
TypRewriter >> rewrite: aMethod at: anInteger [
	| cut selector code |
	cut := aMethod selector copyFrom: 4 to: aMethod selector size.
	selector := self normalizeSelector: cut asSymbol at: anInteger.
	code := selector
		,
			' aLookup 
	<typShaMethod: ''' , cut
		,
			'''>
	'
		,
			(aMethod sourceCode
				copyFrom: aMethod ast selectorAndArgumentNames size + 1
				to: aMethod sourceCode size).
	aMethod origin compile: code classified: 'shadow'.
	^ aMethod removeFromSystem
]

{ #category : #accessing }
TypRewriter >> rewriteMethods [
	<gtExample>
	^ (((TypShaShadow allSubclasses
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods)
		select:
			[ :e | (e selector beginsWith: '___') or: [ e selector beginsWith: '~~~' ] ])
		collectWithIndex: [ :e :i | self rewrite: e at: i ]
]
