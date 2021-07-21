Class {
	#name : #TypRewriter,
	#superclass : #Object,
	#category : #'Typer-Core-Utility'
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
TypRewriter >> rewriteLookupIndex [
	<gtExample>
	^ ((RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]) flatCollect: #methods)
		select: [ :e | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replace:
					'TypMethodLookupIndex instance
				resultTypeFor:
					(TypMethodLookup
						receiver: `@r
						selector: `@s
						arguments: `@a)'
				with:
					'(TypLookupIndex lookupMethodOfReceiver: `@r
						selector: `@s
						arguments: `@a) result'.
			rewriter
				replace:
					'TypMethodLookupIndex instance
				signalsAlwaysFor:
					(TypMethodLookup
						receiver: `@r
						selector: `@s
						arguments: `@a)'
				with:
					'(TypLookupIndex lookupMethodOfReceiver: `@r
						selector: `@s
						arguments: `@a) signalsAlways'.
			rewriter
				replace:
					'TypMethodLookupIndex instance
				argumentTypeFor:
					(TypMethodLookup
						receiver: `@r
						selector: `@s
						arguments: `@a) at: `@i'
				with:
					'(TypLookupIndex lookupMethodOfReceiver: `@r
						selector: `@s
						arguments: `@a) arguments at: `@i'.
			ok := rewriter executeTree: e parseTree.
			ok
				ifTrue:
					[ e origin compile: rewriter tree formattedCode classified: e protocol ].
			ok ]
]

{ #category : #accessing }
TypRewriter >> rewriteMethodLookupIndex [
	<gtExample>
	^ ((RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]) flatCollect: #methods)
		select: [ :e | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replace:
					'TypMethodLookupIndex instance
				resultTypeFor:
					(TypMethodLookup
						receiver: `@r
						selector: `@s
						arguments: `@a)'
				with:
					'(TypLookupIndex lookupMethodOfReceiver: `@r
						selector: `@s
						arguments: `@a) result'.
			rewriter
				replace:
					'TypMethodLookupIndex instance
				signalsAlwaysFor:
					(TypMethodLookup
						receiver: `@r
						selector: `@s
						arguments: `@a)'
				with:
					'(TypLookupIndex lookupMethodOfReceiver: `@r
						selector: `@s
						arguments: `@a) signalsAlways'.
			rewriter
				replace:
					'TypMethodLookupIndex instance
				argumentTypeFor:
					(TypMethodLookup
						receiver: `@r
						selector: `@s
						arguments: `@a) at: `@i'
				with:
					'(TypLookupIndex lookupMethodOfReceiver: `@r
						selector: `@s
						arguments: `@a) arguments at: `@i'.
			ok := rewriter executeTree: e parseTree.
			ok
				ifTrue:
					[ e origin compile: rewriter tree formattedCode classified: e protocol ].
			ok ]
]

{ #category : #accessing }
TypRewriter >> rewritePragmaArguments [
	<gtExample>
	^ #typTypeArgument:as: gtPragmas
		do: [ :m | 
			| n a |
			n := m parseTree.
			a := (1 to: m numArgs) collect: [ :e | '?' ].
			n pragmas copy
				select: [ :e | e selector = #typTypeArgument:as: ]
				thenDo: [ :e | 
					| i |
					i := e arguments first value.
					(i between: 1 and: a size)
						ifTrue: [ a at: i put: e arguments second value ].
					n pragmas remove: e.
					n body removeNode: e ].
			n body
				addNodeFirst:
					(RBPragmaNode
						selector: #typPraArguments:
						keywordsPositions: #(0)
						arguments: {(RBLiteralValueNode value: (',' join: a))}).
			m origin compile: n formattedCode classified: m protocol ]
]

{ #category : #accessing }
TypRewriter >> rewritePragmaArgumentsCleanup [
	<gtExample>
	^ #typPraArguments: gtPragmas
		do: [ :m | 
			| n |
			n := m parseTree.
			(n pragmas select: [ :e | e selector = #typPraArguments: ])
				copyWithoutFirst
				do: [ :e | 
					n pragmas remove: e.
					n body removeNode: e ].
			m origin compile: n formattedCode classified: m protocol ]
]

{ #category : #accessing }
TypRewriter >> rewritePragmaParameters [
	<gtExample>
	^ #typTypeParameters: gtPragmas
		do: [ :m | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replaceTree:
					(RBPatternPragmaNode
						selector: #typTypeParameters:
						keywordsPositions: #(0)
						arguments: {(RBPatternVariableNode identifierNamed: '`@t' at: 0)})
					withTree:
					(RBPatternPragmaNode
							selector: #typPraParameters:
							keywordsPositions: #(0)
							arguments: {(RBPatternVariableNode identifierNamed: '`@t' at: 0)});
				executeTree: m parseTree.
			ok := rewriter executeTree: m parseTree.
			ok
				ifTrue:
					[ m origin compile: rewriter tree formattedCode classified: m protocol ].
			ok ]
]

{ #category : #accessing }
TypRewriter >> rewritePragmaSuperTypeBindTo [
	<gtExample>
	^ #typSuperTypeBind:to: gtPragmas
		do: [ :m | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replaceTree:
					(RBPatternPragmaNode
						selector: #typSuperTypeBind:to:
						keywordsPositions: #(0 0)
						arguments:
							{(RBPatternVariableNode identifierNamed: '`@n' at: 0).
							(RBPatternVariableNode identifierNamed: '`@t' at: 0)})
					withTree:
					(RBPatternPragmaNode
							selector: #typPraSuperTypeBind:to:
							keywordsPositions: #(0 0)
							arguments:
								{(RBPatternVariableNode identifierNamed: '`@n' at: 0).
								(RBPatternVariableNode identifierNamed: '`@t' at: 0)});
				executeTree: m parseTree.
			ok := rewriter executeTree: m parseTree.
			ok
				ifTrue:
					[ m origin compile: rewriter tree formattedCode classified: m protocol ].
			ok ]
]

{ #category : #accessing }
TypRewriter >> rewritePragmaTypeResult [
	<gtExample>
	^ #typTypeResultAs: gtPragmas
		do: [ :m | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replaceTree:
					(RBPatternPragmaNode
						selector: #typTypeResultAs:
						keywordsPositions: #(0)
						arguments: {(RBPatternVariableNode identifierNamed: '`@t' at: 0)})
					withTree:
					(RBPatternPragmaNode
							selector: #typPraResult:
							keywordsPositions: #(0)
							arguments: {(RBPatternVariableNode identifierNamed: '`@t' at: 0)});
				executeTree: m parseTree.
			ok := rewriter executeTree: m parseTree.
			ok
				ifTrue:
					[ m origin compile: rewriter tree formattedCode classified: m protocol ].
			ok ]
]

{ #category : #accessing }
TypRewriter >> rewritePragmaVariable [
	<gtExample>
	^ #typTypeVariable:as: gtPragmas
		do: [ :m | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replaceTree:
					(RBPatternPragmaNode
						selector: #typTypeVariable:as:
						keywordsPositions: #(0 0)
						arguments:
							{(RBPatternVariableNode identifierNamed: '`@n' at: 0).
							(RBPatternVariableNode identifierNamed: '`@t' at: 0)})
					withTree:
					(RBPatternPragmaNode
							selector: #typPraVariable:as:
							keywordsPositions: #(0 0)
							arguments:
								{(RBPatternVariableNode identifierNamed: '`@n' at: 0).
								(RBPatternVariableNode identifierNamed: '`@t' at: 0)});
				executeTree: m parseTree.
			ok := rewriter executeTree: m parseTree.
			ok
				ifTrue:
					[ m origin compile: rewriter tree formattedCode classified: m protocol ].
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
TypRewriter >> rewriteShadowMethodReturn: e [
	| rewriter |
	rewriter := RBParseTreeRewriter new.
	rewriter
		replace:
			'^ TypFunctionType new
		argumentTypes: { `@a1 . `@a2 };
		resultType: [ `@r ];
		yourself'
		with:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: `@r
		arguments: { `@a1 . `@a2 }';
		replace:
			'^ TypFunctionType new
		argumentTypes: { `@a1 . `@a2 . `@a3 };
		resultType: [ `@r ];
		yourself'
		with:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: `@r
		arguments: { `@a1 . `@a2 . `@a3 }';
		replace:
			'^ TypFunctionType new
		argumentTypes: { `@a1 . `@a2 . `@a3 . `@a4 };
		resultType: [ `@r ];
		yourself'
		with:
			'^ CompiledMethod
		typAsFunctionTypeWithResult: `@r
		arguments: { `@a1 . `@a2 . `@a3 . `@a4 }'.
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
TypRewriter >> rewriteShadowMigrated [
	<gtExample>
	#typShaForVariable: gtPragmas do: [:m | m ].
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
TypRewriter >> rewriteShadowMigratedCleanup [
	<gtExample>
	^ #typMigrated gtPragmas
		do: [ :m | 
			| n |
			n := m parseTree.
			(n pragmas select: [ :e | e selector = #typMigrated ])
				do: [ :e | 
					n pragmas remove: e.
					n body removeNode: e ].
			m origin compile: n formattedCode classified: m protocol ]
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

{ #category : #accessing }
TypRewriter >> rewriteShadowVariable [
	<gtExample>
	^ #typShaForVariable: gtPragmas
		do: [ :m | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replaceTree:
					(RBPatternPragmaNode
						selector: #typShaForVariable:
						keywordsPositions: #(0)
						arguments: {(RBPatternVariableNode identifierNamed: '`@t' at: 0)})
					withTree:
					(RBPatternPragmaNode
							selector: #typShaVariable:
							keywordsPositions: #(0)
							arguments: {(RBPatternVariableNode identifierNamed: '`@t' at: 0)});
				executeTree: m parseTree.
			ok := rewriter executeTree: m parseTree.
			ok
				ifTrue:
					[ m origin compile: rewriter tree formattedCode classified: m protocol ].
			ok ]
]

{ #category : #accessing }
TypRewriter >> rewriteVariableLookupIndex [
	<gtExample>
	^ ((RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer' ]) flatCollect: #methods)
		select: [ :e | 
			| rewriter ok method |
			rewriter := RBParseTreeRewriter new.
			rewriter
				replace: 'TypLookupIndex lookupMethodOfReceiver: `@r selector: `@s arguments: `@a'
				with: '`@r lookupMethod: `@s arguments: `@a'.
			ok := rewriter executeTree: e parseTree.
			ok
				ifTrue:
					[ e origin compile: rewriter tree formattedCode classified: e protocol ].
			ok ]
]
