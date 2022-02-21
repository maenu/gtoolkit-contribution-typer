Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [

	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription includesSelector:
		  aLookup selector
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnClassChange: aClassAnnouncement [

	self flag: 'FIXME'
	"| class |
	class := aClassAnnouncement classAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		self flag: 'FIXME figure out how invalidation should work'.
		class typAsType >= receiver or: [ 
			(receiver invalidateOnClassChange: aClassAnnouncement) or: [ 
				context invalidateOnClassChange: aClassAnnouncement ] ] ]"
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"| method |
	method := aMethodAnnouncement methodAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		(method selector = selector and: [ 
			 method methodClass typAsType >= receiver ]) or: [ 
			(association key invalidateOnMethodChange: aMethodAnnouncement) 
				or: [ context invalidateOnMethodChange: aMethodAnnouncement ] ] ]"
]

{ #category : #printing }
TypInfMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'inf method'
]

{ #category : #accessing }
TypInfMethodResolver >> resolve: aLookup [

	self assert: [ self canResolve: aLookup ].
	^ aLookup receiver classDescription >> aLookup selector 
		  typInfTypeIn: aLookup root receiver
]
