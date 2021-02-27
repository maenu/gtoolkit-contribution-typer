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
