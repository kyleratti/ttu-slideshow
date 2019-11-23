export declare enum MessageType {
    Full = "full",
    NewImage = "new-image",
    DeleteImage = "delete-image"
}
export interface FullSocketMessage {
    type: MessageType.Full;
    data: string[];
}
export interface NewImageSocketMessage {
    type: MessageType.NewImage;
    data: string;
}
export interface DeleteImageSocketMessage {
    type: MessageType.DeleteImage;
    data: string;
}
export declare type SocketMessage = FullSocketMessage | NewImageSocketMessage | DeleteImageSocketMessage;
