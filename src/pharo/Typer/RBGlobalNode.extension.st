Extension { #name : #RBGlobalNode }

{ #category : #'*Typer' }
RBGlobalNode >> typTypeRecursive [
	| clazz |
	(self binding isGlobalClassNameBinding or: [ self binding isGlobalVariable ])
		ifTrue: [ ^ self binding value class typAsType ].
	clazz := self methodNode methodClass.
	"lookup pool in defining class"
	self binding typIsFromSharedPool
		ifTrue: [ clazz := self binding scope getClass instanceSide sharedPools detect: [ :e | e classVarNames includes: name ] ].
	^ clazz classSide typTypeForVariable: name asSymbol
]
