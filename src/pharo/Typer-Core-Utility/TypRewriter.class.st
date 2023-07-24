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
			rewriter replace: '`@r copyWithParameters: {#A -> `@a} asDictionary' with: '`@r copyWithParameters: {`@a}'.
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
TypRewriter >> rewriteNilInstance [

	<gtExample>
	^ ((RPackageOrganizer default packages select: [ :e | 
		    e name beginsWith: 'Typer' ]) flatCollect: #methods) select: [ 
		  :e | 
		  | rewriter ok method |
		  rewriter := RBParseTreeRewriter new.
		  rewriter
			  replace: 'TypNilType new'
			  with: 'TypNilType instance'.
		  ok := rewriter executeTree: e parseTree.
		  ok ifTrue: [ 
			  e origin
				  compile: rewriter tree formattedCode
				  classified: e protocol ].
		  ok ]
]

{ #category : #accessing }
TypRewriter >> rewriteNilNewCopyWithOrigins [

	<gtExample>
	^ ((RPackageOrganizer default packages select: [ :e | 
		    e name beginsWith: 'Typer' ]) flatCollect: #methods) select: [ 
		  :e | 
		  | rewriter ok method |
		  rewriter := RBParseTreeRewriter new.
		  rewriter
			  replace: 'TypNilType new copyWithOrigins: { `@o }'
			  with: 'TypNilType origin: `@o'.
		  ok := rewriter executeTree: e parseTree.
		  ok ifTrue: [ 
			  e origin
				  compile: rewriter tree formattedCode
				  classified: e protocol ].
		  ok ]
]

{ #category : #accessing }
TypRewriter >> rewriteNodeInOutSenders [
	<gtExample>
	| sink |
	sink := AsyncCollectionSink forCollection: OrderedCollection new.
	((('Typer' gtPackageMatches
		& ('outgoing' gtSubstringMatch | 'incoming' gtSubstringMatch)
		select: [ :e | e methodClass ~= self class ]) result
		collect: [ :e | 
			| sourceCode |
			sourceCode := e sourceCode.
			sourceCode := sourceCode copyReplaceAll: 'outgoing' with: 'out'.
			sourceCode := sourceCode copyReplaceAll: 'incoming' with: 'in'.
			e origin compile: sourceCode classified: e protocol.
			e origin >> e selector ]) forward: sink) wait.
	^ sink collection
]

{ #category : #accessing }
TypRewriter >> rewriteParameterASyntax [

	<gtExample>
	| sink |
	sink := AsyncCollectionSink forCollection: OrderedCollection new.
	((('Typer' gtPackageMatches & '@A' gtSubstringMatch select: [ :e | 
		   e methodClass ~= self class ]) result collect: [ :e | 
		  | sourceCode |
		  sourceCode := e sourceCode.
		  sourceCode := sourceCode copyReplaceAll: '''''@A''''' with: '#A'.
		  sourceCode := sourceCode copyReplaceAll: '''@A''' with: '#A'.
		  sourceCode := sourceCode copyReplaceAll: '@A' with: '#A'.
		  e origin compile: sourceCode classified: e protocol.
		  e origin >> e selector ]) forward: sink) wait.
	^ sink collection
]

{ #category : #accessing }
TypRewriter >> rewriteParameterBSyntax [

	<gtExample>
	| sink |
	sink := AsyncCollectionSink forCollection: OrderedCollection new.
	((('Typer' gtPackageMatches & '@B' gtSubstringMatch select: [ :e | 
		   e methodClass ~= self class ]) result collect: [ :e | 
		  | sourceCode |
		  sourceCode := e sourceCode.
		  sourceCode := sourceCode copyReplaceAll: '''''@B''''' with: '#B'.
		  sourceCode := sourceCode copyReplaceAll: '''@B''' with: '#B'.
		  sourceCode := sourceCode copyReplaceAll: '@B' with: '#B'.
		  e origin compile: sourceCode classified: e protocol.
		  e origin >> e selector ]) forward: sink) wait.
	^ sink collection
]

{ #category : #accessing }
TypRewriter >> rewriteParameterSyntax [

	<gtExample>
	| sink |
	sink := AsyncCollectionSink forCollection: OrderedCollection new.
	((('Typer' gtPackageMatches & '#A' gtSubstringMatch) result 
		  collect: [ :e | 
			  e origin
				  compile: ((e sourceCode copyReplaceAll: '#A' with: '#A')
						   copyReplaceAll: '''@B'''
						   with: '#B')
				  classified: e protocol ]) forward: sink) wait.
	^ sink collection
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
			rewriter replace: '`@r copyWithParameters: {#A -> `@a} asDictionary' with: '`@r copyWithParameters: {`@a}'.
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
			rewriter replace: '`@r copyWithParameters: {#A -> `@a} asDictionary' with: '`@r copyWithParameters: {`@a}'.
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
TypRewriter >> rewriteShadowToExtension: aShadow [
	self rewriteShadowToExtensionType: aShadow.
	self rewriteShadowToExtensionVariables: aShadow.
	self rewriteShadowToExtensionMethods: aShadow
]

{ #category : #accessing }
TypRewriter >> rewriteShadowToExtensionAll [
	<gtExample>
	((RPackageOrganizer default packages
		select: [ :e | e name beginsWith: 'Typer-Shadow-' ])
		flatCollect: #definedClasses)
		do: [ :e | 
			self rewriteShadowToExtensionBoth: e.
			e removeFromSystem ].
	#typShaType: gtPragmas do: #reformat.
	#typShaVariable: gtPragmas do: #reformat.
	#typShaMethod: gtPragmas do: #reformat
]

{ #category : #accessing }
TypRewriter >> rewriteShadowToExtensionBoth: aClass [
	self rewriteShadowToExtension: aClass new.
	self rewriteShadowToExtension: aClass
]

{ #category : #accessing }
TypRewriter >> rewriteShadowToExtensionMethods: aShadow [
	aShadow class methods
		select: [ :e | e hasPragmaNamed: #typShaMethod: ]
		thenDo: [ :method | 
			| selector code |
			selector := method selector.
			selector := selector copyFrom: 2 to: selector size.
			code := 'typShaMethod' , selector
					, ' aLookup
	'
					, (method sourceCode
							copyFrom: method ast selectorAndArgumentNames size + 1
							to: method sourceCode size).
			aShadow shadowedClass
				compile: code
				classified: '*' , aShadow class package name.
			method removeFromSystem ]
]

{ #category : #accessing }
TypRewriter >> rewriteShadowToExtensionType: aShadow [
	| method code |
	(aShadow class includesSelector: #resolveType:) ifFalse: [ ^ self ].
	method := aShadow class methodDict at: #resolveType:.
	code := 'typShaResolve: aLookup 
	<typShaType>
	'
			, (method sourceCode
					copyFrom: method ast selectorAndArgumentNames size + 1
					to: method sourceCode size).
	aShadow shadowedClass
		compile: code
		classified: '*' , aShadow class package name.
	method removeFromSystem
]

{ #category : #accessing }
TypRewriter >> rewriteShadowToExtensionVariables: aShadow [
	aShadow class methods
		select: [ :e | e hasPragmaNamed: #typShaVariable: ]
		thenDo: [ :method | 
			| selector code |
			selector := method selector.
			selector := selector copyFrom: 2 to: selector size.
			code := 'typShaVariable' , selector
					, ' aLookup
	'
					, (method sourceCode
							copyFrom: method ast selectorAndArgumentNames size + 1
							to: method sourceCode size).
			aShadow shadowedClass
				compile: code
				classified: '*' , aShadow class package name.
			method removeFromSystem ]
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
TypRewriter >> rewriteUnknownInstance [

	<gtExample>
	^ ((RPackageOrganizer default packages select: [ :e | 
		    e name beginsWith: 'Typer' ]) flatCollect: #methods) select: [ 
		  :e | 
		  | rewriter ok method |
		  rewriter := RBParseTreeRewriter new.
		  rewriter
			  replace: 'TypUnknownType new'
			  with: 'TypUnknownType instance'.
		  ok := rewriter executeTree: e parseTree.
		  ok ifTrue: [ 
			  e origin
				  compile: rewriter tree formattedCode
				  classified: e protocol ].
		  ok ]
]

{ #category : #accessing }
TypRewriter >> rewriteUnknownNewCopyWithOrigins [

	<gtExample>
	^ ((RPackageOrganizer default packages select: [ :e | 
		    e name beginsWith: 'Typer' ]) flatCollect: #methods) select: [ 
		  :e | 
		  | rewriter ok method |
		  rewriter := RBParseTreeRewriter new.
		  rewriter
			  replace: 'TypUnknownType new copyWithOrigins: { `@o }'
			  with: 'TypUnknownType origin: `@o'.
		  ok := rewriter executeTree: e parseTree.
		  ok ifTrue: [ 
			  e origin
				  compile: rewriter tree formattedCode
				  classified: e protocol ].
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
