Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtCanType [
	^ self typHasDefiningClass
]

{ #category : #'*Typer-GToolkit' }
RBGlobalNode >> typGtFiltersToTypeWithPragma [
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
	| clazz shadows shadow variableType method |
	self assert: [ self typGtCanType ].
	clazz := self typDefiningClass.
	shadows := TypShaShadow shadowClassesFor: clazz.
	shadows size > 1
		ifTrue: [ ^ shadows ].
	shadow := shadows isEmpty
		ifTrue: [ TypShaShadow typGtNewShadowFor: clazz ]
		ifFalse: [ shadows anyOne ].
	variableType := self typType.
	method := shadow typGtShadowClassVariable: self name type: variableType.
	^ (TypGtCoderTypeFilter new
		type: method methodClass typAsType;
		yourself) & (GtCoderImplementorsFilter selector: method selector)
]
