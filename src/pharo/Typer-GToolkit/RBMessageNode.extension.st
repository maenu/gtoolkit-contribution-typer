Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanTypeIn: aContext [
	| receiverType |
	receiverType := aContext type: self receiver.
	receiverType isNamed ifFalse: [ ^ false ].
	^ receiverType hasClassDescription
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtInvokedMethodsIn: aContext [
	| methods receiverType |
	methods := super typGtInvokedMethodsIn: aContext.
	receiverType := aContext type: receiver.
	(receiverType isNamed and: [ receiverType hasClassDescription ])
		ifTrue: [ receiverType classDescription
				classAndMethodFor: selector value
				do: [ :c :m | ^ methods , {m} ]
				ifAbsent: [  "noop" ] ].
	^ methods
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtShadowMethodIn: aContext [
	| method_ receiverType argumentTypes resultType |
	self flag: 'FIXME'.
	self assert: [ self typGtCanTypeIn: nil ].
	method_ := self typInfNodeSelf type.
	receiverType := self receiver typInfTypeSelf.
	argumentTypes := method_ arguments.
	resultType := method_ result.
	^ receiverType classDescription
		typGtShadowMethod: self selector
		result: resultType
		arguments: argumentTypes
]
