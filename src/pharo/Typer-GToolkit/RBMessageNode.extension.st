Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanType [
	| receiverType |
	receiverType := self receiver typInfTypeSelf.
	receiverType isNamed ifFalse: [ ^ false ].
	^ receiverType hasClassDescription
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtInvokedMethods [

	| methods receiverType |
	methods := super typGtInvokedMethods.
	receiverType := receiver typInfTypeSelf.
	(receiverType isNamed and: [ receiverType hasClassDescription ]) 
		ifTrue: [ 
			receiverType classDescription
				classAndMethodFor: selector value
				do: [ :c :m | ^ methods , { m } ]
				ifAbsent: [  ] ].
	^ methods
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtShadowMethod [
	| method_ receiverType argumentTypes resultType |
	self assert: [ self typGtCanType ].
	method_ := self typInfNodeSelf type.
	receiverType := self receiver typInfTypeSelf.
	argumentTypes := method_ arguments.
	resultType := method_ result.
	^ receiverType classDescription
		typGtShadowMethod: self selector
		result: resultType
		arguments: argumentTypes
]
