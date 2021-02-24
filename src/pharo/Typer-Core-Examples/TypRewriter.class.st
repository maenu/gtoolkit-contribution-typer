Class {
	#name : #TypRewriter,
	#superclass : #Object,
	#category : #'Typer-Core-Examples'
}

{ #category : #accessing }
TypRewriter >> rewriteCopyWithParameters [
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
TypRewriter >> rewriteShadow: aMethod at: anInteger [
	| cut selector code |
	cut := aMethod selector copyFrom: 4 to: aMethod selector size.
	selector := self rewriteShadowSelector: cut asSymbol at: anInteger.
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
TypRewriter >> rewriteShadowMethodReturn1: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ TypFunctionType new
			argumentTypes: [ :i :a :s :r | `@a typAsType ];
			resultType: [ :a :s :r | `@r typAsType ];
			yourself'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: `@r typAsType arguments: {`@a typAsType} argumentsOptional: false signalsAlways: false'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn2: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ TypFunctionType new
			argumentTypes: [ :i :a :s :r | `@a typAsType ];
			resultType: [ :a :s :r | a receiverType ];
			yourself'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: aLookup receiverType arguments: {`@a typAsType} argumentsOptional: false signalsAlways: false'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn3: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ TypFunctionType new
			argumentTypes: [ TypNoTypeError signal ];
			resultType: [ :a :s :r | `@r typAsType ];
			yourself'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: `@r typAsType arguments: {} argumentsOptional: false signalsAlways: false'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn4: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ TypFunctionType new
			argumentTypes: [ `@a typAsType ];
			resultType: [ `@r typAsType ];
			yourself'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: `@r typAsType arguments: {`@a typAsType} argumentsOptional: false signalsAlways: false'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn5: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ TypFunctionType new
			argumentTypes: [ :i :a :s :r | `@a typAsType ];
			resultType: [ :a :s :r | TypUnknownType new ];
			yourself'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: TypUnknownType new arguments: {`@a typAsType} argumentsOptional: false signalsAlways: false'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn6: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: `@r
		arguments: {}
		argumentsOptional: false
		signalsAlways: false'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: `@r'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn7: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: `@r
		arguments: `@a
		argumentsOptional: false
		signalsAlways: false'
		with:
			'^ CompiledMethod typAsFunctionTypeWithResult: `@r arguments: `@a'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturn: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType'
		with:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: ''@self'' typAsVariableType'.
	rewriter
		replace:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: `@a'
		with:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: ''@self'' typAsVariableType
		arguments: `@a'.
	^ (rewriter executeTree: e parseTree)
		ifTrue:
			[ e origin compile: rewriter tree formattedCode classified: e protocol ]
		ifFalse: [ e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethodReturns [
	<gtExample>
	^ ((TypShaShadow withAllSubclasses flatCollect: #methods)
		select:
			[ :e | e pragmas anySatisfy: [ :f | f selector = #typShaMethod: ] ])
		collect: [ :e | self rewriteShadowMethodReturn: e ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowMethods [
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
TypRewriter >> rewriteShadowSelector: aSymbol at: anInteger [
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
TypRewriter >> rewriteShadowSelectors [
	<gtExample>
	^ (((TypShaShadow allSubclasses
		flatCollect: [ :e | 
			{e instanceSide.
			e classSide} ]) flatCollect: #methods)
		select:
			[ :e | (e selector beginsWith: '___') or: [ e selector beginsWith: '~~~' ] ])
		collectWithIndex: [ :e :i | self rewriteShadow: e at: i ]
]
