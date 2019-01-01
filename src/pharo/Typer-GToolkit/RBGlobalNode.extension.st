Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanType [
	<typTypeResultAs: 'Boolean'>
	^ self typHasDefiningClass
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithPragma [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	self assert: [ self typGtCanType ].
	^ (TypGtCoderTypeFilter new
		type: self typDefiningClass typAsType;
		yourself)
		&
			(TypGtCoderDefinerFilter new
				name: self name;
				yourself) & (GtCoderImplementorsFilter selector: #initialize)
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithShadow [
	<typTypeResultAs: 'GtCoderMethodsFilter'>
	| clazz variableType shadows |
	self assert: [ self typGtCanType ].
	clazz := self typDefiningClass.
	variableType := self typType.
	shadows := (TypShaShadow shadowClassesFor: clazz)
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
				yourself) & (GtCoderImplementorsFilter selector: method selector) ])
		reduce: [ :a :b | a | b ]
]
