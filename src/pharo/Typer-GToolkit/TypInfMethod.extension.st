Extension { #name : #TypInfMethod }

{ #category : #'*Typer-GToolkit' }
TypInfMethod >> typGtAsShortString [
	^ 'met'
]

{ #category : #'*Typer-GToolkit' }
TypInfMethod >> typGtColor [
	^ BrGlamorousColors failureBorderColor
]

{ #category : #'*Typer-GToolkit' }
TypInfMethod >> typGtShaCanType [
	^ self type hasClassDescription
]

{ #category : #'*Typer-GToolkit' }
TypInfMethod >> typGtShaMethod [
	| type |
	self assert: [ self typGtShaCanType ].
	type := self type.
	^ type classDescription typGtShaMethod: node selector value type: type
]
