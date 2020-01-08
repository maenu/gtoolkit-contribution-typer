Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanType [
	<typTypeResultAs: 'Boolean'>
	^ self typHasDefiningType
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithPragma [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	self assert: [ self typGtCanType ].
	^ (TypGtCoderTypeFilter new
		type: self typDefiningType typAsType;
		yourself)
		&
			(TypGtCoderDefinerFilter new
				name: self name;
				yourself) & (GtSearchImplementorsFilter selector: #initialize)
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithShadow [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	| clazz variableType shadows |
	self assert: [ self typGtCanType ].
	clazz := self typDefiningType.
	variableType := self typType.
	shadows := (TypShaShadow typGtShadowFor: clazz)
		ifEmpty: [ {(TypShaShadow typGtNewShadowFor: clazz)} ]
		ifNotEmpty: #yourself.
	^ (shadows
		collect: [ :e | 
			| method |
			method := e
				typGtShadowClassVariable: self name asSymbol
				type: variableType.
			(TypGtCoderTypeFilter new
				type: method methodClass typAsType;
				yourself) & (GtSearchImplementorsFilter selector: method selector) ])
		reduce: [ :a :b | a | b ]
]
