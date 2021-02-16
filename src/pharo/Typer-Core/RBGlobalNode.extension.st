Extension { #name : #RBGlobalNode }

{ #category : #'*Typer-Core' }
RBGlobalNode >> typDefiningType [
	<typTypeResultAs: 'Metaclass'>
	| clazz |
	self assert: [ self typHasDefiningType ].
	clazz := self methodNode methodClass.
	self binding typIsFromSharedPool
		ifTrue: [ clazz := self binding typSharedPool ].
	^ clazz classSide typAsType
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typHasDefiningType [
	^ self binding isClassVariable
		or: [ self binding typIsFromSharedPool ]
]

{ #category : #'*Typer-Core' }
RBGlobalNode >> typTypeRecursive [
	self binding isGlobalClassNameBinding
		ifTrue: [ ^ self binding value class typAsType ].
	self typHasDefiningType
		ifTrue: [ ^ TypVariableLookupIndex instance
				typeFor:
					(TypVariableLookup new
						receiverType: self typDefiningType;
						selector: self name asSymbol;
						yourself) ].
	^ TypUnknownType new
]
