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
	| type clazz shadows shadow variableType method |
	type := self methodNode methodClass typAsType.
	clazz := type hasClass
		ifTrue: [ type asClass ]
		ifFalse: [ Object ].
	shadows := TypShaShadow shadowClassesFor: clazz.
	shadows size > 1
		ifTrue: [ ^ shadows ].
	shadow := shadows isEmpty
		ifTrue: [ TypShaShadow typGtNewShadowFor: clazz ]
		ifFalse: [ shadows anyOne ].
	variableType := self typType.
	method := (clazz isClassSide
		ifTrue: [ shadow typGtShadowClassInstanceVariable: self name type: variableType ]
		ifFalse: [ shadow typGtShadowInstanceVariable: self name type: variableType ]) "typCastAs CompiledMethod<Integer>".
	^ (TypGtCoderTypeFilter new
		type: method methodClass typAsType;
		yourself) & (GtCoderImplementorsFilter selector: method selector)
]