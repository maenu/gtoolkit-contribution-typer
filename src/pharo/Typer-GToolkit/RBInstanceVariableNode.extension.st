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
				yourself) & (GtCoderImplementorsFilter selector: #initialize)
]

{ #category : #'*Typer-GToolkit' }
RBInstanceVariableNode >> typGtFiltersToTypeWithShadow [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	| type clazz shadows variableType |
	type := self methodNode methodClass typAsType.
	clazz := type representsClass
		ifTrue: [ type asClass ]
		ifFalse: [ Object ].
	variableType := self typType.
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
				yourself) & (GtCoderImplementorsFilter selector: method selector) ])
		reduce: [ :a :b | a | b ]
]
