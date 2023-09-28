Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtCanTypeIn: aContext [
	| receiverType |
	receiverType := aContext type: self receiver.
	receiverType isNamed ifFalse: [ ^ false ].
	^ receiverType hasClassDescription
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
