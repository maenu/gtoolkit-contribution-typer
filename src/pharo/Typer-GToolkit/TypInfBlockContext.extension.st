Extension { #name : #TypInfBlockContext }

{ #category : #'*Typer-GToolkit' }
TypInfBlockContext >> typGtAsCoderViewModel [
	^ (node typGtAsCoderViewModelFor: self)
		selfObject: self self classDescription;
		yourself
]
