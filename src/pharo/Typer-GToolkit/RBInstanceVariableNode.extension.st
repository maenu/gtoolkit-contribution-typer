Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtCanType [
	^ true
]

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtFiltersToTypeWithPragma [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	^ (TypGtCoderTypeFilter new
		type: self methodNode methodClass typAsType;
		yourself)
		&
			(TypGtCoderDefinerFilter new
				name: self name;
				yourself) & (GtSearchImplementorsFilter selector: #initialize)
]

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtFiltersToTypeWithShadow [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	| type clazz shadows variableType |
	type := self methodNode methodClass typAsType.
	clazz := (type isNamed and: [ type hasClassDescription ])
		ifTrue: [ type classDescription ]
		ifFalse: [ Object ].
	variableType := self typInfType.
	shadows := (TypShaShadow typGtShadowFor: clazz)
		ifEmpty: [ {(TypShaShadow typGtNewShadowFor: clazz)} ]
		ifNotEmpty: #yourself.
	^ (shadows
		collect: [ :e | 
			| method |
			method := clazz isClassSide
				ifTrue: [ e
						typGtShadowClassInstanceVariable: self name asSymbol
						type: variableType ]
				ifFalse:
					[ e typGtShadowInstanceVariable: self name asSymbol type: variableType ].
			^ (TypGtCoderTypeFilter new
				type: method methodClass typAsType;
				yourself) & (GtSearchImplementorsFilter selector: method selector) ])
		reduce: [ :a :b | a | b ]
]
