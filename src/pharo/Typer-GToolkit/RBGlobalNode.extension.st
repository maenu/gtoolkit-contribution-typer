Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanType [
	<typPraResult: 'Boolean'>
	^ self typInfHasDefiningType
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithPragma [
	<typPraResult: 'GtCoderMethodsFilter'>
	self assert: [ self typGtCanType ].
	^ (TypGtCoderTypeFilter new
		type: self typInfDefiningType typAsType;
		yourself)
		&
			(TypGtCoderDefinerFilter new
				name: self name;
				yourself) & (GtSearchImplementorsFilter selector: #initialize)
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithShadow [
	<typPraResult: 'GtCoderMethodsFilter'>
	| clazz variableType shadows |
	self assert: [ self typGtCanType ].
	clazz := self typInfDefiningType.
	variableType := self typInfType.
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
