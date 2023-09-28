Class {
	#name : #TypDynReportMethodItem,
	#superclass : #TypDynReportItem,
	#instVars : [
		'method'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynReportMethodItem >> gtSourceFor: aView [

	<gtView>
	^ aView forward
		  title: 'Source';
		  priority: 10;
		  object: [ clazz >> name ];
		  view: #gtSourceFor:
]

{ #category : #accessing }
TypDynReportMethodItem >> isUnknown: aType [

	^ (aType result isUnion not and: [ aType result >= Object typAsType ]) 
		  and: [ 
			  aType arguments allSatisfy: [ :t | 
				  t isUnion not and: [ t >= Object typAsType ] ] ]
]
