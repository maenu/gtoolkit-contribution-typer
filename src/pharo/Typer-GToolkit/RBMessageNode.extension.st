Extension { #name : #RBMessageNode }

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtShaCanTypeIn: aContext [
	| receiverType |
	receiverType := aContext type: self receiver.
	receiverType isNamed ifFalse: [ ^ false ].
	^ receiverType hasClassDescription
]

{ #category : #'*Typer-GToolkit' }
RBMessageNode >> typGtShaMethodIn: aContext [
	| method_ receiverType argumentTypes resultType |
	self flag: 'FIXME'.
	self assert: [ self typGtShaCanTypeIn: nil ].
	method_ := self typInfNodeSelf type.
	receiverType := self receiver typInfTypeSelf.
	argumentTypes := method_ arguments.
	resultType := method_ result.
	^ receiverType classDescription
		typGtShaMethod: self selector
		result: resultType
		arguments: argumentTypes
]
